import 'package:agent_dashboard/application/controller/onboarding/agreement.dart';
import 'package:agent_dashboard/application/controller/auth/auth.dart';
import 'package:agent_dashboard/application/controller/claims/claims.dart';
import 'package:agent_dashboard/application/controller/counsiler_connect/counsiler_connect.dart';
import 'package:agent_dashboard/application/controller/home/home.dart';
import 'package:agent_dashboard/application/controller/onboarding/onboarding.dart';
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
