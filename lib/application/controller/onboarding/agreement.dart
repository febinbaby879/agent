import 'dart:typed_data';
import 'package:agent_dashboard/data/feature/file_picker/file_picker_service.dart';
import 'package:agent_dashboard/data/feature/pdf/pdf_service.dart';
import 'package:agent_dashboard/data/feature/signature/signature_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class AgreementController extends GetxController {
  final pdfBytes = Rxn<Uint8List>();
  final signatureBytes = Rxn<Uint8List>();
  final signedPdfBytes = Rxn<Uint8List>();

  RxBool signatureLoading = false.obs;
  RxBool uploadPdfLoading = false.obs;

  SignatureController signatureController() => SignatureService.controller;

  Future<void> pickPdf() async {
    try {
      // pdfBytes.value = await File("C:/Flutter-dev/eduguardian/requirements files/agrement template.pdf").readAsBytes();
      print('pickPdf 1');
      final files = await FilePickerHelper.pickPdfWeb();
      print('pickPdf 2 : ${files.length} ${files.first == null}');
      if (files.isNotEmpty && files.first != null) {
        print('pickPdf 3');
        pdfBytes.value = files.first;
      }
    } catch (e) {
      print('pickPdf 4 : $e');
    }
  }

  void clearSignature() => SignatureService.clearSignature();
  Future<void> getSignature(BuildContext context) async {
    print('add signature');
    final result = await SignatureService.captureSignature(context);
    if (result != null) {
      signatureBytes.value = result;
      signPdf();
    }
  }

  Future<void> signPdf() async {
    signatureLoading.value = true;
    signatureBytes.value = await SignatureService.getSignature();
    print('signPdf 1');
    if (pdfBytes.value != null && signatureBytes.value != null) {
      print('signPdf 2');
      final signed = await PdfService.addSignatureToPdf(
        pdfBytes.value!,
        signatureBytes.value!,
      );
      print('signPdf 3');
      signedPdfBytes.value = signed;
    } else {
      print('signPdf 4');
      Get.snackbar(
          "Missing Data", "Please upload PDF and sign before proceeding");
    }
    signatureLoading.value = false;
  }
}
