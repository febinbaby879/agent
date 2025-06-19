import 'dart:typed_data';

import 'package:agent_dashboard/application/controller/onboarding/agreement_controller.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/html/html_page_viewer.dart';
import 'package:agent_dashboard/data/feature/pdf/pdf_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class ScreenAgrementSignature extends StatefulWidget {
  const ScreenAgrementSignature({super.key, this.id, this.service});

  final String? service;
  final String? id;

  @override
  State<ScreenAgrementSignature> createState() =>
      _ScreenAgrementSignatureState();
}

class _ScreenAgrementSignatureState extends State<ScreenAgrementSignature> {
  @override
  void initState() {
    Get.find<AgreementController>()
        .getAgreement(id: widget.id, service: widget.service);
    scrollController = ScrollController();
    super.initState();
  }

  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AgreementController>();
    return Scaffold(
      body: Obx(() {
        final pdfBytes = controller.pdfBytes.value;
        final signedPdfBytes = controller.signedPdfBytes.value;
        if (controller.getAgreementLoading.value) {
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 40,
            ),
          );
        }

        if (controller.agrementModel.value.signatureStatus?.isAvailable ==
                true &&
            controller.agrementModel.value.signatureStatus?.signaturePath !=
                null) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Page not available',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                kHeight15,
                Text('Signatiure Updated'),
              ],
            ),
          );
        }

        if (controller.uploadSignatureResponse.value.agent?.documents
                ?.agentSignature ==
            'Uploaded') {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Agreement Submitted successfully',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                kHeight15,
                Text(
                    'Your agreement and signature is in review, you will get a confirmation shortly'),
              ],
            ),
          );
        }

        return Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 1000;
                if (isMobile) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          _DocumentSection(
                            signedPdfBytes: signedPdfBytes,
                            isMobile: true,
                          ),
                          _SignaturePart(
                            controller: controller,
                            onSignatureAdded: () {
                              _scrollToBottom();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          child: Column(
                            children: [
                              _SignaturePart(
                                controller: controller,
                                onSignatureAdded: () {
                                  _scrollToBottom();
                                },
                              ),
                              kHeight60,
                              kHeight60,
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: isMobile ? 1 : 6,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: kRadius10,
                              boxShadow: boxShadow2),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: _DocumentSection(
                            signedPdfBytes: signedPdfBytes,
                            isMobile: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            if (controller.uploadPdfLoading.value)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: kBlack.withOpacity(0.8),
                child: const Center(
                  child: CupertinoActivityIndicator(
                    radius: 40,
                    color: kWhite,
                  ),
                ),
              )
          ],
        );
      }),
      floatingActionButton: Obx(() {
        if (controller.uploadSignatureResponse.value.agent?.documents
                ?.agentSignature ==
            'Uploaded') return kEmpty;
        if (controller.signatureBytes.value != null) {
          return SizedBox(
            // width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                controller.uploadSignature(widget.id ?? "");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPurple,
                foregroundColor: kWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
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
      }),
    );
  }

  void _scrollToBottom() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }
}

class _DocumentSection extends StatelessWidget {
  const _DocumentSection({
    // required this.pdfBytes,
    required this.isMobile,
    required this.signedPdfBytes,
  });

  // final Uint8List? pdfBytes;
  final Uint8List? signedPdfBytes;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AgreementController>();
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
        Obx(
          () {
            return Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: kRadius10,
                        border: Border.all(),
                        boxShadow: boxShadow1),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 40,
                      vertical: 0,
                    ),
                    child: Html(
                      data: controller.agrementModel.value.generatedAgreement
                              ?.content ??
                          '',
                    )
                    // child: _DocumentSection(
                    //     pdfBytes: pdfBytes, signedPdfBytes: signedPdfBytes),
                    ),
                if (controller.signatureBytes.value != null)
                  Positioned(
                    bottom: 50,
                    left: 100,
                    child: Image.memory(
                      controller.signatureBytes.value!,
                      height: 50,
                      width: 75,
                    ),
                  )
              ],
            );
          },
        ),
        // WebPdfViewer(
        //   pdfBytes: signedPdfBytes ?? pdfBytes ?? Uint8List(1),
        // ),
        kHeight40,
      ],
    );
  }
}

class _SignaturePart extends StatelessWidget {
  const _SignaturePart(
      {required this.controller, required this.onSignatureAdded});

  final AgreementController controller;
  final VoidCallback onSignatureAdded;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Sign Agreement',
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
                      controller.clearSignature();
                      // controller.pickPdf();
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
                      onSignatureAdded();
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
          ],
        ),
        ElevatedButton(
            onPressed: () {
              PdfService.downloadHtmlAsPdf(
                  // controller.agrementModel.value.generatedAgreement?.content ??
                  //     ""
                  );
            },
            child: Text('download'))
      ],
    );
  }
}
