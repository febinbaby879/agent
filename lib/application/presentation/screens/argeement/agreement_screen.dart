import 'package:agent_dashboard/application/controller/agreement.dart';
import 'package:agent_dashboard/application/presentation/screens/argeement/widgets/pdf_viewer_blob.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class ScreenSignatureTest extends StatelessWidget {
  const ScreenSignatureTest({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AgreementController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Signature Capture')),
      body: Obx(() {
        final pdfBytes = controller.pdfBytes.value;
        final signedPdfBytes = controller.signedPdfBytes.value;
        final signature = controller.signatureBytes.value;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: controller.pickPdf,
                child: const Text('Pick PDF'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => controller.getSignature(context),
                child: const Text('Capture Signature'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: controller.signPdf,
                child: const Text('Sign PDF'),
              ),
              const SizedBox(height: 24),
              if (signature != null) ...[
                const Text('Signature Preview:'),
                const SizedBox(height: 8),
                Image.memory(signature, width: 150, height: 80),
              ],
              const SizedBox(height: 24),
              if (pdfBytes != null) ...[
                const Text('Original PDF Preview:'),
                const SizedBox(height: 8),
                SizedBox(
                  height: 500,
                  width: 300,
                  child: WebPdfViewer(
                    pdfBytes: pdfBytes,
                  ),
                  // child: PdfViewPinch(
                  //   controller: PdfControllerPinch(
                  //     document: PdfDocument.openData(pdfBytes),
                  //   ),
                  // ),
                ),
              ],
              const SizedBox(height: 24),
              const Text('Signed PDF Preview:'),
              if (signedPdfBytes != null) ...[
                const Text('Signed PDF Preview:'),
                const SizedBox(height: 8),
                SizedBox(
                  height: 500,
                  width: 300,
                  child: WebPdfViewer(
                    pdfBytes: signedPdfBytes,
                  ),
                  // child: PdfViewPinch(
                  //   controller: PdfControllerPinch(
                  //     document: PdfDocument.openData(signedPdfBytes),
                  //   ),
                  // ),
                ),
              ],
            ],
          ),
        );
      }),
    );
  }
}
