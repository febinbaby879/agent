import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/toast/flutter_toast.dart';
import 'package:agent_dashboard/data/service/auth/auth_service.dart';
import 'package:agent_dashboard/domain/model/auth/login/login_model/login_model.dart';
import 'package:agent_dashboard/domain/model/auth/otp_verify_model/otp_verify_model.dart';
import 'package:agent_dashboard/domain/model/auth/register_model/register_model.dart';
import 'package:agent_dashboard/domain/model/auth/rest_new_password/rest_new_password.dart';
import 'package:agent_dashboard/domain/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthController extends GetxController {
  final AuthRepo _authService = AuthService();

  // login
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // signup
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
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

  // forgot pasword
  final GlobalKey<FormState> forgotPasswordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> newPasswordKey = GlobalKey<FormState>();
  final TextEditingController emailForgotPasswordController =
      TextEditingController();
  final TextEditingController otpForgotPasswordController =
      TextEditingController();
  final TextEditingController newPasswordForgotPasswordController =
      TextEditingController();

  RxBool loginLoading = false.obs;
  RxBool registerLoading = false.obs;
  RxBool otpLoading = false.obs;
  RxBool showLogin = true.obs;
  RxBool showOtp = false.obs;
  RxBool forgotPasswordLoading = false.obs;
  RxBool newPasswordLoading = false.obs;

  void showLoginCard(bool value) {
    showLogin.value = value;
    showOtp.value = false;
  }

  void showOtpCard(bool value) {
    showOtp.value = value;
    showCustomToast(message: 'Otp Send Sucessfuly');
  }

  /// get login status of user and navigate to appropriate screen
  Future<void> getLog(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    context.go(Routes.login);
    // context.go(Routes.onboardingScreen);
    // context.go(Routes.homeScreen);
  }

  /// login agent
  Future<void> login(BuildContext context) async {
    if (loginKey.currentState?.validate() ?? false) {
      loginLoading.value = true;
      final result = await _authService.userLogin(
          loginModel: LoginModel(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              deviceToken: ''));
      result.fold((l) {}, (r) {});
      loginLoading.value = false;
    }
  }

  /// regiser agent
  Future<void> registerAgent() async {
    if (signUpKey.currentState?.validate() ?? false) {
      registerLoading.value = true;
      final result = await _authService.userRegister(
        registerModel: RegisterModel(
          agencyName: agencyNameSignupController.text.trim(),
          agentCountry: countrySignupController.text.trim(),
          agentEmailId: emailSignupController.text.trim(),
          agentName: nameSignupController.text.trim(),
          agentPhoneNumber: phoneSignupController.text.trim(),
          directorName: directorsNameSignupController.text.trim(),
          directorContactNumber: directorsPhoneSignupController.text.trim(),
        ),
      );
      result.fold((l) {
        showCustomToast(message: l.message ?? errorMessage);
      }, (r) {
        showOtpCard(true);
      });
      registerLoading.value = false;
    }
  }

  /// verify email for registration
  Future<void> verifyRegisterOtp(BuildContext context) async {
    otpLoading.value = true;
    final result = await _authService.verifOtpRegister(
      otpVerifyModel: OtpVerifyModel(
        email: emailSignupController.text.trim(),
        otp: otpSignupController.text.trim(),
      ),
    );
    result.fold((l) {}, (r) {
      // TODO: show onboarding
    });
    otpLoading.value = false;
  }

  /// forgot password otp send
  Future<void> forgotPassword(BuildContext context) async {
    if (forgotPasswordKey.currentState?.validate() ?? false) {
      forgotPasswordLoading.value = true;
      final result = await _authService.forgotPassword(
          restNewPassword: RestNewPassword(
              email: emailForgotPasswordController.text.trim()));
      result.fold((l) {}, (r) {});
      forgotPasswordLoading.value = false;
    }
  }

  /// reset new password
  Future<void> resetPassword(BuildContext context) async {
    if (newPasswordKey.currentState?.validate() ?? false) {
      newPasswordLoading.value = true;
      final result = await _authService.resetPassword(
          restNewPassword: RestNewPassword(
        email: emailForgotPasswordController.text.trim(),
        newPassword: newPasswordForgotPasswordController.text.trim(),
        otp: otpForgotPasswordController.text.trim(),
      ));
      result.fold((l) {}, (r) {
        // TODO: show login page
      });
      newPasswordLoading.value = false;
    }
  }
}
