import 'package:agent_dashboard/application/controller/home.dart';
import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/application/presentation/screens/wishlist/wishlist_course.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/hover_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BuildProfileSideBar extends StatelessWidget {
  const BuildProfileSideBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                height: 550,
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
                        const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Your Name',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('f@gmail.com',
                                  style: TextStyle(color: Colors.grey)),
                              SizedBox(height: 2),
                              Text('+91 6238075738',
                                  style: TextStyle(color: Colors.grey))
                            ]),
                        const Spacer(),
                        CircularPercentIndicator(
                            radius: 50,
                            lineWidth: 7,
                            percent: 1.0,
                            center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Profile', style: textStyle1),
                                  Text('100%', style: textStyle1)
                                ]),
                            progressColor: Colors.green,
                            backgroundColor: Colors.green.withOpacity(0.2))
                      ]),
                      kHeight20,
                      Expanded(
                          child: SingleChildScrollView(
                              child: Column(children: [
                        HoverMenuItem(
                            iconColor: kpurple400,
                            icon: Icons.favorite_outline,
                            text: 'Wishlist Institutions',
                            onTap: () => showDialog(
                                context: context,
                                builder: (context) => const WhislistDailog())),
                        HoverMenuItem(
                            iconColor: kpurple400,
                            icon: Icons.golf_course,
                            text: 'Wishlist Courses',
                            onTap: () => showDialog(
                                context: context,
                                builder: (context) => const WhislistDailog())),
                        HoverMenuItem(
                            iconColor: kpurple400,
                            icon: Icons.money,
                            text: 'Commissions',
                            onTap: () {}),
                        HoverMenuItem(
                            iconColor: kpurple400,
                            icon: Icons.manage_accounts,
                            text: 'Relationship Manager',
                            onTap: () {}),
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
