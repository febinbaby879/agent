import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Future<void> getLog(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // context.go(Routes.login);
    Get.offAndToNamed(Routes.login);
  }
}
