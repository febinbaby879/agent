import 'package:agent_dashboard/application/controller/home.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/dashboard_content.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/logo.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/top_navabr.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
        body: Column(children: [
      SizedBox(
          width: double.infinity,
          height: 70,
          child: Row(children: [
            const LogoWithText(),
            const Spacer(),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.person, color: kpurple400)),
            kWidth15
          ])),
      Expanded(
          child: Row(children: [
        const BuildTopNavbar(),
        kWidth15,
        Expanded(
            child:
                Obx(() => homeController.selectedTabContent.value == 'dashboard'
                    ? const BuildDashboardContent()
                    : homeController.selectedTabContent.value == 'applications'
                        ? const ApplicationsContent()
                        : homeController.selectedTabContent.value == 'courses'
                            ? const CoursesContent()
                            : const OnlineCounsellorContent()))
      ]))
    ]));
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
  Widget build(BuildContext context) {
    return const Center(child: Text("Courses Content goes here."));
  }
}

class OnlineCounsellorContent extends StatelessWidget {
  const OnlineCounsellorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Online Counsellor Courses Content goes here."));
  }
}

class BuildSideBArItem extends StatelessWidget {
  const BuildSideBArItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Text(title,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700)));
  }
}
