import 'package:get/get.dart';

class OnboardingController extends GetxController {
  RxInt step = 0.obs;
  List<String> steps = ['Step 1', 'Step 2', 'Step 3'];
  RxList<bool> stepCompletion = [true, false, false].obs;
  RxBool refreshing = false.obs;

  Future<void> refreshOnboarding() async {
    if (refreshing.value) return;
    refreshing.value = true;
    await Future.delayed(const Duration(seconds: 2));
    refreshing.value = false;
  }

  /// onboarding steps
  void changeStep(int step) {
    this.step.value = step;
  }
}
