import 'package:agent_dashboard/application/controller/home/home_controller.dart';
import 'package:agent_dashboard/application/controller/onboarding/onboarding_controller.dart';
import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/application/presentation/screens/wishlist/wishlist_course.dart';
import 'package:agent_dashboard/application/presentation/utils/animations/hover_effect.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/hover/hover_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BuildProfileSideBar extends StatelessWidget {
  const BuildProfileSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Obx(() => Get.find<HomeController>().profileEnable.value &&
            (!Responsive.isMobile(context) && !Responsive.isTab(context))
        ? Positioned(
            top: 50,
            right: MediaQuery.of(context).size.width < 600 ? 10 : 50,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: kRadius5,
                    border: Border.all(color: kpurple400!),
                    color: Colors.white),
                width: 550,
                height: 450,
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(children: [
                        const CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('assets/images/submit.png')),
                        kWidth20,
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  controller.onBoardingStatus.value.agentInfo
                                          ?.name ??
                                      "",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text(
                                  controller.onBoardingStatus.value.agentInfo
                                          ?.email ??
                                      "",
                                  style: const TextStyle(color: Colors.grey)),
                              const SizedBox(height: 2),
                              Text(
                                  controller.onBoardingStatus.value.agentInfo
                                          ?.phone ??
                                      "",
                                  style: const TextStyle(color: Colors.grey))
                            ]),
                        const Spacer(),
                        HoverEffectWidget(
                          child: CircularPercentIndicator(
                              radius: 50,
                              lineWidth: 7,
                              percent: (controller.onBoardingStatus.value
                                          .progress?.percentage ??
                                      0) *
                                  0.01,
                              center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Profile', style: textStyle1),
                                    Text(
                                        '${controller.onBoardingStatus.value.progress?.percentage ?? 0}%',
                                        style: textStyle1)
                                  ]),
                              progressColor: Colors.green,
                              backgroundColor: Colors.green.withOpacity(0.2)),
                        )
                      ]),
                      kHeight20,
                      Expanded(
                          child: SingleChildScrollView(
                              child: Column(children: [
                        // HoverMenuItem(
                        //     iconColor: kpurple400,
                        //     icon: Icons.favorite_outline,
                        //     text: 'Wishlist Institutions',
                        //     onTap: () => showDialog(
                        //         context: context,
                        //         builder: (context) => const WhislistDailog())),
                        // HoverMenuItem(
                        //     iconColor: kpurple400,
                        //     icon: Icons.golf_course,
                        //     text: 'Wishlist Courses',
                        //     onTap: () => showDialog(
                        //         context: context,
                        //         builder: (context) => const WhislistDailog())),
                        // HoverMenuItem(
                        //     iconColor: kpurple400,
                        //     icon: Icons.money,
                        //     text: 'Commissions',
                        //     onTap: () {}),
                        // HoverMenuItem(
                        //     iconColor: kpurple400,
                        //     icon: Icons.manage_accounts,
                        //     text: 'Relationship Manager',
                        //     onTap: () {}),
                        HoverMenuItem(
                            iconColor: kpurple400,
                            icon: Icons.work,
                            text: 'How we Work',
                            onTap: () {}),
                        HoverMenuItem(
                            iconColor: kpurple400,
                            icon: Icons.whatshot_sharp,
                            text: 'Whatsapp Link',
                            onTap: () {}),
                        HoverMenuItem(
                            iconColor: kpurple400,
                            icon: Icons.video_call,
                            text: 'Video Tutorials',
                            onTap: () {})
                      ]))),
                      kHeight30,
                      Row(children: [
                        Expanded(
                            child: HoverMenuItem(
                                iconColor: kpurple400,
                                icon: Icons.logout,
                                text: 'LOG-OUT',
                                onTap: () {})),
                        TextButton(
                            onPressed: () {
                              Get.find<HomeController>().profileAction();
                              context.go(Routes.profile);
                            },
                            child: const Text('Visit Profile'))
                      ])
                    ])))
        : kEmpty);
  }
}
