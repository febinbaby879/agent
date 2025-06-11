import 'package:agent_dashboard/application/controller/profile/profile_controller.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/hover/hover_menu.dart';
import 'package:agent_dashboard/application/presentation/widgets/hover/hover_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidebarWidget extends StatelessWidget {
  final double maxWidth;

  const SidebarWidget({super.key, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    return Container(
      width: maxWidth,
      color: kWhite,
      child: SingleChildScrollView(
        child: Column(children: [
          // User profile card
          Container(
              padding: const EdgeInsets.all(16),
              color: kWhite,
              child: Row(children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        value: 1,
                        backgroundColor: kGrey,
                        color: kpurple400,
                      ),
                    ),
                    MouseHoverSwitcher(
                      hoverChild: CircleAvatar(
                        radius: 36,
                        backgroundColor: kpurple400,
                        child: Text(
                          // '${(controller.onBoardingStatus.value.progress?.percentage ?? 0)}%',
                          'Agent',
                          style: const TextStyle(color: kWhite),
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: kpurple400,
                        child: const Hero(
                          tag: 'profile_icon',
                          child: Icon(Icons.person, size: 36, color: kWhite),
                        ),
                      ),
                    ),
                  ],
                ),
                kWidth10,
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Hello,',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  Obx(
                    () => Text(
                      profileController.profileInfo.value.agentName ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  )
                ])
              ])),
          kHeight10,
          // MY ORDERS
          // HoverMenuItem(
          //     icon: Icons.favorite, text: 'Course Wishlists', onTap: () {}),
          // HoverMenuItem(
          //     icon: Icons.favorite_sharp,
          //     text: 'Institute Wishlists',
          //     onTap: () {}),
          Obx(
            () => Column(
              children: [
                HoverMenuItem(
                    icon: Icons.person_2_outlined,
                    text: 'Business Information',
                    isSelected:
                        profileController.profileNavItem.value == 'profile',
                    onTap: () {
                      profileController.changeProfileNavItem('profile');
                    }),
                HoverMenuItem(
                    icon: Icons.security_rounded,
                    text: 'Banking Info',
                    isSelected:
                        profileController.profileNavItem.value == 'bankingInfo',
                    onTap: () {
                      profileController.changeProfileNavItem('bankingInfo');
                    }),
                HoverMenuItem(
                    icon: Icons.shopping_bag_outlined,
                    isSelected:
                        profileController.profileNavItem.value == 'aboutUs',
                    text: 'About Us',
                    onTap: () {
                      profileController.changeProfileNavItem('aboutUs');
                    }),
                // HoverMenuItem(
                //     icon: Icons.shopping_bag_outlined, text: 'PAYMENTS', onTap: () {}),
                // kHeight30,
                HoverMenuItem(
                    iconColor: kpurple400,
                    icon: Icons.logout,
                    text: 'LOG-OUT',
                    onTap: () {}),
                // NavItem(
                //     icon: Icons.shopping_bag_outlined,
                //     title: 'Course Wishlists',
                //     isSelected: false,
                //     onTap: () {}),
                // // ACCOUNT SETTINGS
                // NavItem(
                //   icon: Icons.person_outline,
                //   title: 'Institute Wishlists',
                //   isSelected: true,
                //   onTap: () {},
                // ),
                // NavItem(
                //   icon: Icons.person_outline,
                //   title: 'About us',
                //   isSelected: true,
                //   onTap: () {},
                // ),
                // NavItem(
                //     icon: Icons.payment_outlined,
                //     title: 'PAYMENTS',
                //     isSelected: false,
                //     onTap: () {}),
                // NavItem(
                //   icon: Icons.folder_outlined,
                //   title: 'L',
                //   isSelected: false,
                //   onTap: () {},)
              ],
            ),
          )
        ]),
      ),
    );
  }
}
