import 'package:agent_dashboard/application/controller/onboarding/agreement_controller.dart';
import 'package:agent_dashboard/application/controller/auth/auth_controller.dart';
import 'package:agent_dashboard/application/controller/claims/claims_controller.dart';
import 'package:agent_dashboard/application/controller/counsiler_connect/counsiler_connect_controller.dart';
import 'package:agent_dashboard/application/controller/home/home_controller.dart';
import 'package:agent_dashboard/application/controller/onboarding/onboarding_controller.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AgreementController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => CounsillerController());
    Get.lazyPut(() => ClaimsController());
    Get.lazyPut(() => OnboardingController());
  }
}
