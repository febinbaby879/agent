import 'package:agent_dashboard/application/controller/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Get.find<AuthController>();
      controller.getLog(context);
    });
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
            // valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
      ),
    );
  }
}
