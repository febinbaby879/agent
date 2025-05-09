import 'package:agent_dashboard/application/controller/home.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/applications.dart';
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
                child: Obx(() => homeController.selectedTabContent.value ==
                        'dashboard'
                    ? const BuildDashboardContent()
                    : homeController.selectedTabContent.value == 'applications'
                        ? const ApplicationsScreen()
                        : homeController.selectedTabContent.value == 'courses'
                            ? CoursesSection()
                            : homeController.selectedTabContent.value ==
                                    'institution'
                                ? const InstitutionList()
                                : const OnlineCounsellorContent()),
              ))
            ]))
          ]),
          const BuildProfileSideBar()
        ])));
  }
}

class ApplicationsContent extends StatelessWidget {
  const ApplicationsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Applications Content goes here."));
  }
}

class CoursesContent extends StatelessWidget {
  const CoursesContent({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: Text("Courses Content goes here."));
}

class OnlineCounsellorContent extends StatelessWidget {
  const OnlineCounsellorContent({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: Text("Online Counsellor Courses Content goes here."));
}
