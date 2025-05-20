import 'dart:typed_data';

import 'package:agent_dashboard/application/controller/onboarding/agreement.dart';
import 'package:agent_dashboard/application/presentation/screens/auth/widgets/pdf_viewer_blob.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:signature/signature.dart';

class ScreenAgrementSignature extends StatelessWidget {
  const ScreenAgrementSignature({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AgreementController>();

    return Scaffold(
      body: Obx(() {
        final pdfBytes = controller.pdfBytes.value;
        final signedPdfBytes = controller.signedPdfBytes.value;

        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 768;
            if (isMobile) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      _SignaturePart(controller: controller),
                      _DocumentSection(
                          pdfBytes: pdfBytes, signedPdfBytes: signedPdfBytes),
                    ],
                  ),
                ),
              );
            }
            return SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child: Column(
                        children: [
                          _SignaturePart(controller: controller),
                          kHeight60,
                          kHeight60,
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: isMobile ? 1 : 6,
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 20 : 40,
                        vertical: 0,
                      ),
                      child: _DocumentSection(
                          pdfBytes: pdfBytes, signedPdfBytes: signedPdfBytes),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

class _DocumentSection extends StatelessWidget {
  const _DocumentSection({
    required this.pdfBytes,
    required this.signedPdfBytes,
  });

  final Uint8List? pdfBytes;
  final Uint8List? signedPdfBytes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        adjustHieght(25),
        const Text(
          'Agreement Document',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4A4A4A),
          ),
        ),
        kHeight10,
        WebPdfViewer(
          pdfBytes: signedPdfBytes ?? pdfBytes ?? Uint8List(1),
        ),
        kHeight40,
      ],
    );
  }
}

class _SignaturePart extends StatelessWidget {
  const _SignaturePart({
    required this.controller,
  });

  final AgreementController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Agreement',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4A4A4A),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'To complete your application, we kindly ask you to review and sign the contract. Your signature ensures that you acknowledge and agree to the terms outlined in the document. Once signed, please submit the form to proceed with your application. Thank you for your cooperation!',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF6B7280),
          ),
        ),
        kHeight20,
        Column(
          children: [
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: kRadius5,
                  border: Border.all()),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Signature(
                    backgroundColor: kWhite,
                    controller: controller.signatureController(),
                  ),
                ),
              ),
            ),
            kHeight20,
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // controller.clearSignature();
                      controller.pickPdf();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPurple,
                      foregroundColor: kWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.clear),
                    label: const Text(
                      'Clear',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  kWidth10,
                  ElevatedButton(
                    onPressed: () {
                      controller.signPdf();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPurple,
                      foregroundColor: kWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: controller.signatureLoading.value
                        ? const CircularProgressIndicator(
                            color: kWhite,
                          )
                        : const Text(
                            'Add Signature',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            kHeight15,
            Obx(() {
              if (controller.signedPdfBytes.value != null) {
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // controller.signPdf();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPurple,
                      foregroundColor: kWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: controller.uploadPdfLoading.value
                        ? const CircularProgressIndicator(
                            color: kWhite,
                          )
                        : const Text(
                            'Submit Agreement',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                );
              }
              return kEmpty;
            })
          ],
        )
      ],
    );
  }
}
