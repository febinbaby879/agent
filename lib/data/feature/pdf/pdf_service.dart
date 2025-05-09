import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_render/pdf_render.dart' as render;
import 'package:image/image.dart' as img;
import 'dart:ui' as ui;

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

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat(page.width, page.height),
          build: (_) {
            return pw.Stack(
              children: [
                pw.Image(pw.MemoryImage(imgList), fit: pw.BoxFit.cover),
                if (i == renderDoc.pageCount)
                  pw.Positioned(
                    bottom: 30,
                    right: 30,
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
}
