import 'package:agent_dashboard/application/presentation/screens/home/widgets/nav_item.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 900;
    return SizedBox(
        width: isSmallScreen ? 80 : 260,
        child: const Column(children: [
          BuildNavItem(
            title: 'Dashboard',
            icon: Icons.dashboard,
            tabKey: 'dashboard',
          ),
          BuildNavItem(
            title: 'Applications',
            icon: Icons.settings_applications,
            tabKey: 'applications',
          ),
          BuildNavItem(
            title: 'Courses',
            icon: Icons.menu_book_outlined,
            tabKey: 'courses',
          ),
          BuildNavItem(
              title: 'Institutions',
              icon: Icons.connect_without_contact_sharp,
              tabKey: 'institution'),
          BuildNavItem(
              title: 'Connect Consiller',
              icon: Icons.connect_without_contact_sharp,
              tabKey: 'online_courses')
        ]));
  }
}
