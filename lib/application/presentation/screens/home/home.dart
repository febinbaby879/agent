import 'package:agent_dashboard/application/controller/home/home_controller.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/applications.dart';
import 'package:agent_dashboard/application/presentation/screens/claims/claims_screen.dart';
import 'package:agent_dashboard/application/presentation/screens/counsillor/connect_counsiler_screen.dart';
import 'package:agent_dashboard/application/presentation/screens/courses/courses.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/dashboard_content.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/side_bar.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/tobbar.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/top_navabr.dart';
import 'package:agent_dashboard/application/presentation/screens/institutions/institution.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return GestureDetector(
        onTap: () => homeController.profileEnable.value = false,
        child: Scaffold(
            body: Stack(children: [
          Column(children: [
            const TopBar(),
            Expanded(
                child: Row(children: [
              const SideBar(),
              kWidth15,
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Obx(() {
                  switch (homeController.selectedTabContent.value) {
                    case 'dashboard':
                      return const BuildDashboardContent();
                    case 'applications':
                      return const ApplicationsScreen();
                    case 'courses':
                      return CoursesSection();
                    case 'institution':
                      return const InstitutionList();
                    case 'counsiller_connect':
                      return const OnlineCounsellorContent();
                    case 'claims':
                      return const ClaimsSection();
                    default:
                      return const SizedBox.shrink();
                  }
                }),
              ))
            ]))
          ]),
          const BuildProfileSideBar()
        ])));
  }
}
