import 'package:agent_dashboard/application/controller/agreement.dart';
import 'package:agent_dashboard/application/controller/auth.dart';
import 'package:agent_dashboard/application/controller/claims.dart';
import 'package:agent_dashboard/application/controller/counsiler_connect.dart';
import 'package:agent_dashboard/application/controller/home.dart';
import 'package:agent_dashboard/application/controller/onboarding.dart';
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
