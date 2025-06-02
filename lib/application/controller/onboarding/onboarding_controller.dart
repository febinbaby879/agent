import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/data/service/onboarding/onboarding_service.dart';
import 'package:agent_dashboard/data/shared_preference/shared_preferences.dart';
import 'package:agent_dashboard/domain/model/onboard/onboard_satus_model/onboard_satus_model.dart';
import 'package:agent_dashboard/domain/repository/onboarding_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class OnboardingController extends GetxController {
  final OnboardingRepo _onboardingService = OnboardingService();

  RxBool refreshing = false.obs;
  RxBool error = false.obs;

  /// onboarding status data
  Rx<OnboardSatusModel> onBoardingStatus = OnboardSatusModel().obs;

  Future<void> refreshOnboarding(BuildContext context) async {
    if (refreshing.value) return;
    refreshing.value = true;
    error.value = false;
    final result = await _onboardingService.getOnboardStatus();
    result.fold(
      (l) => error.value = true,
      (r) {
        onBoardingStatus.value = r;
        error.value = false;
        if (r.progress?.isComplete ?? false) {
          SharedPreferecesStorage.setOnBoard(true);
          context.go(Routes.homeScreen);
        }
      },
    );
    refreshing.value = false;
  }
}
