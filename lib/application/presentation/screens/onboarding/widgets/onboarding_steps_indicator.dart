part of '../onboarding_screen.dart';

class _OnboardingStepsIndicator extends StatelessWidget {
  const _OnboardingStepsIndicator();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            boxShadow: boxShadow4, color: kWhite, borderRadius: kRadius5),
        child: Row(
          children: List.generate(
            controller.onBoardingStatus.value.stages?.length ?? 0,
            (index) => Expanded(
              child: Obx(
                () {
                  final step = controller.onBoardingStatus.value.stages?[index];
                  return HoverEffectWidget(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            step?.name ?? 'STEP !',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          kHeight10,
                          LinearProgressIndicator(
                            color: kpurple400,
                            value: (controller.onBoardingStatus.value.progress
                                            ?.completedStages ??
                                        0) <=
                                    index
                                ? 0
                                : 1,
                            borderRadius: kRadius5,
                            minHeight: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
