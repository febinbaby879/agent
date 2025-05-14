import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailSignupController = TextEditingController();
  final TextEditingController nameSignupController = TextEditingController();
  final TextEditingController agencyNameSignupController =
      TextEditingController();
  final TextEditingController directorsNameSignupController =
      TextEditingController();
  final TextEditingController directorsPhoneSignupController =
      TextEditingController();
  final TextEditingController countrySignupController = TextEditingController();
  final TextEditingController addressSignupController = TextEditingController();
  final TextEditingController phoneSignupController = TextEditingController();
  final TextEditingController otpSignupController = TextEditingController();

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  RxBool loginLoading = false.obs;
  RxBool registerLoading = false.obs;
  RxBool otpLoading = false.obs;
  RxBool showLogin = true.obs;
  RxBool showOtp = false.obs;

  void showLoginCard(bool value) {
    showLogin.value = value;
    showOtp.value = false;
  }

  void showOtpCard(bool value) {
    showOtp.value = value;
  }

  /// get login status of user and navigate to appropriate screen
  Future<void> getLog(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    // context.go(Routes.login);
    context.go(Routes.onboardingScreen);
    // context.go(Routes.homeScreen);
  }
}
