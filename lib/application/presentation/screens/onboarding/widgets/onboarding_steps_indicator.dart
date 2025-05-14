part of '../onboarding_screen.dart';

class _OnboardingStepsIndicator extends StatelessWidget {
  const _OnboardingStepsIndicator();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          boxShadow: boxShadow4, color: kWhite, borderRadius: kRadius5),
      child: Row(
        children: List.generate(
          controller.steps.length,
          (index) => Expanded(
            child: Obx(
              () => HoverEffectWidget(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        controller.steps[index],
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      kHeight10,
                      LinearProgressIndicator(
                        color: kpurple400,
                        value: controller.stepCompletion[index] ? 1 : 0,
                        borderRadius: kRadius5,
                        minHeight: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
