import 'package:agent_dashboard/application/controller/home/home.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/logo.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return SizedBox(
        width: double.infinity,
        height: 70,
        child: Row(children: [
          const LogoWithText(),
          const Spacer(),
          IconButton(
              onPressed: () => homeController.profileAction(),
              icon: Icon(Icons.person, color: kpurple400)),
          kWidth15
        ]));
  }
}
