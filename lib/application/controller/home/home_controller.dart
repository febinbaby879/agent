import 'package:agent_dashboard/data/service/home/home.dart';
import 'package:agent_dashboard/domain/model/course_model/data.dart';
import 'package:agent_dashboard/domain/repository/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// Loading
  RxBool whishListLoading = false.obs;
  RxBool courseLoading = false.obs;

  final HomeRepo homeRepo = HomeService();

  // Sorting Controllers
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  RxString selectedIntake = 'Choose Intake'.obs;

  /// Dash board
  RxString selectedTabContent = 'dashboard'.obs;

  // All Course
  Rx<CourseData> allCourses = CourseData().obs;

  // Overlay Home Screen
  RxBool notificationEnable = false.obs;
  RxBool profileEnable = false.obs;
  RxBool drawerActionBool = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllCourses(isLaod: true);
  }

  void changeTabContent({required String item}) =>
      selectedTabContent.value = item;

  void profileAction() => profileEnable.value = !profileEnable.value;

  List<String> projectTopics = [
    'All',
    'MIBD',
    'eduGuardian',
    'WINC',
    'CTC',
    'UoB RAK',
    'Vibe Education'
  ];
  RxString selectedProjectDropdown = ''.obs;
  void changeProjectDropDown(String value) =>
      selectedProjectDropdown.value = value;

  void getAllCourses({bool isLaod = false}) async {
    //if (!isLaod) return;
    courseLoading.value = true;
    final data = await homeRepo.getCourse();
    data.fold((l) => null, (r) {
      //log('${r}');
      return allCourses.value = r;
    });
    courseLoading.value = false;
  }
}
