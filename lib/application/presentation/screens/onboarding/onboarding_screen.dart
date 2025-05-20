import 'package:agent_dashboard/application/controller/onboarding/onboarding.dart';
import 'package:agent_dashboard/application/presentation/utils/animations/hover_effect.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'widgets/onboarding_steps_indicator.dart';

class ScreenOnboarding extends StatelessWidget {
  const ScreenOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kpurple400,
        foregroundColor: kWhite,
        title: const Text('eduGuardian Business Onboarding'),
        actions: [
          Obx(() {
            if (controller.refreshing.value) {
              return Container(
                  margin: const EdgeInsets.only(right: 20),
                  height: 30,
                  width: 30,
                  child: const CircularProgressIndicator(color: kWhite));
            }
            return IconButton(
              icon: const Icon(Icons.refresh, color: kWhite),
              onPressed: () {
                controller.refreshOnboarding();
              },
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            kHeight15,
            const _OnboardingStepsIndicator(),
            kHeight10,
          ],
        ),
      ),
    );
  }
}
