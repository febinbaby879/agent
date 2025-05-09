import 'package:agent_dashboard/application/controller/agreement.dart';
import 'package:get/get.dart';

class AgreementBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AgreementController>(AgreementController(), permanent: true);
  }
}
