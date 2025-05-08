import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  // Sorting Controllers
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  RxString selectedIntake = 'Choose Intake'.obs;

  /// 
  RxString selectedTabContent = 'dashboard'.obs;

    // Overlay Home Screen
  RxBool notificationEnable = false.obs;
  RxBool profileEnable = false.obs;
  RxBool drawerActionBool = false.obs;

  void changeTabContent({required String item}) =>
      selectedTabContent.value = item;

      void profileAction() {
    profileEnable.value = !profileEnable.value;
    if (notificationEnable.value) {
      notificationEnable.value = !notificationEnable.value;
    }
  }
}


