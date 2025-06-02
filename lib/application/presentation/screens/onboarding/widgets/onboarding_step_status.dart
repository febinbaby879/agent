part of '../onboarding_screen.dart';

class _OnboardingStepsStatus extends StatelessWidget {
  const _OnboardingStepsStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Expanded(
      child: Obx(() {
        final details = controller.onBoardingStatus.value;
        final shedule =
            // details.stages?[1].schedule;
            details.stages?[details.progress?.completedStages ?? 0].schedule;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  controller.onBoardingStatus.value.nextStep?.title ?? "",
                  style: const TextStyle(fontSize: 20, color: kBlack),
                ),
                kHeight10,
                Text(
                  controller.onBoardingStatus.value.nextStep?.message ??
                      'Welcome to the eduGuardian Business Onboarding! '
                          'This is the first step towards becoming a part of our '
                          'educational ecosystem. Please follow the steps below to '
                          'complete your onboarding process.',
                  style: const TextStyle(fontSize: 16, color: kBlack),
                ),
                kHeight10,
                if (shedule != null)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Join Meeting by  :  ${shedule.date?.toLocal()}')
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              if (shedule.meetingLink != null &&
                                  shedule.meetingLink!.isNotEmpty) {
                                // Open the meeting link
                                UrlLauncherService.launch(shedule.meetingLink!);
                              }
                            },
                            child: Text(
                              shedule.meetingLink ?? '',
                              style:
                                  const TextStyle(fontSize: 16, color: kBlue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.onBoardingStatus.value.documents
                            ?.agreementSigned ==
                        false &&
                    details.nextStep?.title == 'Documentation Required')
                  Column(
                    children: [
                      const Text(
                        'Please sign the agreement to proceed with the onboarding process.',
                        style: TextStyle(fontSize: 16, color: kBlack),
                      ),
                      kHeight10,
                      ElevatedButton(
                        onPressed: () {
                          context.go(Routes.agrementSign);
                        },
                        child: const Text('Check Agreement and Add Signature'),
                      ),
                    ],
                  )
              ],
            ),
          ),
        );
      }),
    );
  }
}
