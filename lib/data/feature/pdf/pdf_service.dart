import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_render/pdf_render.dart' as render;
import 'package:image/image.dart' as img;
import 'dart:ui' as ui;
import 'dart:js' as js;

import 'package:printing/printing.dart';

class PdfService {
  static Future<Uint8List> addSignatureToPdf(
      Uint8List originalPdfBytes, Uint8List signatureBytes) async {
    try {
      final renderDoc = await render.PdfDocument.openData(originalPdfBytes);
      final pdf = pw.Document();

      for (int i = 1; i <= renderDoc.pageCount; i++) {
        final page = await renderDoc.getPage(i);
        final pageImage = await page.render();
        final rawImage = await pageImage.createImageDetached();

        // Convert dart:ui.Image to image.Image (from image package)
        final imgBytes =
            await rawImage.toByteData(format: ui.ImageByteFormat.png);
        final imgList = imgBytes!.buffer.asUint8List();

        // Flip the image vertically to correct upside-down issue
        final decodedImage = img.decodeImage(imgList);
        final flippedImage = img.flipVertical(decodedImage!);
        final flippedBytes = img.encodePng(flippedImage);

        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat(page.width, page.height),
            build: (_) {
              return pw.Stack(
                children: [
                  pw.Image(pw.MemoryImage(flippedBytes), fit: pw.BoxFit.cover),
                  if (i == renderDoc.pageCount)
                    pw.Positioned(
                      bottom: 200,
                      left: 150,
                      child: pw.Image(
                        pw.MemoryImage(signatureBytes),
                        width: 100,
                        height: 50,
                      ),
                    ),
                ],
              );
            },
          ),
        );

        // await page.close();
      }

      await renderDoc.dispose();
      return pdf.save();
    } catch (e) {
      print('sign pdf error : $e');
      return originalPdfBytes;
    }
  }

  static void downloadHtmlAsPdf({String containerId = 'html-container'}) {
    js.context.callMethod('eval', [
      """
    const element = document.getElementById('$containerId');
    if (!element) {
      alert('HTML content not found!');
    } else {
      const opt = {
        margin:       10,
        filename:     'download.pdf',
        image:        { type: 'jpeg', quality: 0.98 },
        html2canvas:  { scale: 2 },
        jsPDF:        { unit: 'mm', format: 'a4', orientation: 'portrait' }
      };
      html2pdf().set(opt).from(element).save();
    }
    """
    ]);
  }
}
