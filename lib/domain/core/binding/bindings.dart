import 'package:agent_dashboard/application/controller/agreement.dart';
import 'package:agent_dashboard/application/controller/auth.dart';
import 'package:agent_dashboard/application/controller/home.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AgreementController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AuthController());
  }
}
