import 'package:agent_dashboard/application/controller/onboarding/onboarding_controller.dart';
import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/application/presentation/utils/animations/hover_effect.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/data/feature/url_launcher/url_launcer_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

part 'widgets/onboarding_steps_indicator.dart';
part 'widgets/onboarding_step_status.dart';

class ScreenOnboarding extends StatelessWidget {
  const ScreenOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.refreshOnboarding(context);
    });
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kpurple400,
          foregroundColor: kWhite,
          title: const Text('EduGuardian Business Onboarding'),
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
                  controller.refreshOnboarding(context);
                },
              );
            }),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              kHeight15,
              _OnboardingStepsIndicator(),
              kHeight10,
              _OnboardingStepsStatus(),
            ],
          ),
        ),
        floatingActionButton: Obx(() {
          if (controller.onBoardingStatus.value.documents?.agreementSigned ==
              false) {
            return FloatingActionButton(
              onPressed: () {
                context.go(Routes.homeScreen);
                // context.go(Routes.agrementSign);
              },
              child: const Icon(Icons.home),
            );
          } else {
            return kEmpty;
          }
        }));
  }
}
