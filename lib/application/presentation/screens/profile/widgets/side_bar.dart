import 'package:agent_dashboard/application/presentation/screens/profile/widgets/nav_item.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/hover_menu.dart';
import 'package:flutter/material.dart';

class SidebarWidget extends StatelessWidget {
  final double maxWidth;

  const SidebarWidget({super.key, required this.maxWidth});

  @override
  Widget build(BuildContext context) => Container(
      width: maxWidth,
      color: kWhite,
      child: SingleChildScrollView(
          child: Column(children: [
        // User profile card
        Container(
            padding: const EdgeInsets.all(16),
            color: kWhite,
            child: Row(children: [
              CircleAvatar(
                  radius: 36,
                  backgroundColor: kpurple400,
                  child: const Icon(Icons.person, size: 36, color: kWhite)),
              kWidth10,
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    Text('Feb Bab',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87))
                  ])
            ])),
        kHeight10,
        // MY ORDERS
        HoverMenuItem(
            icon: Icons.favorite, text: 'Course Wishlists', onTap: () {}),
        HoverMenuItem(
            icon: Icons.favorite_sharp,
            text: 'Institute Wishlists',
            onTap: () {}),
        HoverMenuItem(
            icon: Icons.shopping_bag_outlined, text: 'About us', onTap: () {}),
        HoverMenuItem(
            icon: Icons.shopping_bag_outlined, text: 'PAYMENTS', onTap: () {}),
        kHeight30,
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
        //   onTap: () {},
        // )
      ])));
}
