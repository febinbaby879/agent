import 'package:agent_dashboard/data/service/onboarding/onboarding_service.dart';
import 'package:agent_dashboard/domain/model/onboard/onboard_satus_model/onboard_satus_model.dart';
import 'package:agent_dashboard/domain/repository/onboarding_repo.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final OnboardingRepo _onboardingService = OnboardingService();

  RxBool refreshing = false.obs;
  RxBool error = false.obs;

  /// onboarding status data
  Rx<OnboardSatusModel> onBoardingStatus = OnboardSatusModel().obs;

  Future<void> refreshOnboarding() async {
    if (refreshing.value) return;
    refreshing.value = true;
    error.value = false;
    final result = await _onboardingService.getOnboardStatus();
    result.fold(
      (l) => error.value = true,
      (r) {
        onBoardingStatus.value = r;
        error.value = false;
      },
    );
    refreshing.value = false;
  }
}
