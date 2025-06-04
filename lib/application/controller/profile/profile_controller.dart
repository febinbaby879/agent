import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString profileNavItem = 'profile'.obs;

  void changeProfileNavItem(String value) {
    profileNavItem.value = value;
  }
}
