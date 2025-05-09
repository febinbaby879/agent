import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class SignatureService {
  static Future<Uint8List?> captureSignature(BuildContext context) async {
    final controller = SignatureController(
      penColor: Colors.black,
      penStrokeWidth: 2,
    );

    final result = await Get.dialog<Uint8List?>(
      AlertDialog(
        title: const Text('Draw your signature'),
        content: SizedBox(
          width: 400,
          height: 200,
          child: Signature(
            controller: controller,
            backgroundColor: Colors.grey[200]!,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: null),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (controller.isNotEmpty) {
                final data = await controller.toPngBytes();
                Get.back(result: data);
              } else {
                Get.snackbar('Error', 'Signature is empty');
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );

    controller.dispose();
    return result;
  }
}
