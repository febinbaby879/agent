import 'package:agent_dashboard/application/presentation/screens/home/widgets/state_item.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class BuildStateGrid extends StatelessWidget {
  const BuildStateGrid({super.key});

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: kpurple400!),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: boxShadow1),
      child: Row(children: [
        Expanded(
            child: BuildStatteItem(
                onTap: () {},
                count: '1',
                label: 'Total Applications',
                color: kpurple400!,
                icon: Icons.business)),
        Expanded(
            child: BuildStatteItem(
                onTap: () {},
                count: '11',
                label: 'New Applications',
                color: kpurple400!,
                icon: Icons.menu_book)),
        Expanded(
            child: BuildStatteItem(
                onTap: () {},
                count: '0',
                label: 'Offer Letter',
                color: kpurple400!,
                icon: Icons.description)),
        Expanded(
            child: BuildStatteItem(
                onTap: () {},
                count: '1',
                label: 'Visa Approved',
                color: kpurple400!,
                icon: Icons.business)),
      ]));
}
