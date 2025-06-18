import 'package:agent_dashboard/application/controller/profile/profile_controller.dart';
import 'package:agent_dashboard/application/presentation/screens/profile/widgets/about_us_information.dart';
import 'package:agent_dashboard/application/presentation/screens/profile/widgets/banking_info_section.dart';
import 'package:agent_dashboard/application/presentation/screens/profile/widgets/profile_content.dart';
import 'package:agent_dashboard/application/presentation/screens/profile/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 600;
          bool isTab = constraints.maxWidth < 900;
          return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (!isSmallScreen)
              SidebarWidget(maxWidth: constraints.maxWidth * 0.25),
            Expanded(child: Obx(() {
              switch (controller.profileNavItem.value) {
                case 'profile':
                  return ProfileContent(
                      isSmallScreen: isSmallScreen, isTab: isTab);
                case 'bankingInfo':
                  return BankingInformation(isSmallScreen: isSmallScreen);
                case 'aboutUs':
                  return AboutUsInformation(isSmallScreen: isSmallScreen);
                default:
                  return const SizedBox.shrink();
              }
            }))
          ]);
        }),
      ),
    );
  }
}
