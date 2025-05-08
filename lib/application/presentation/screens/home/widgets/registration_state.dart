import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:flutter/material.dart';

import 'registration_item.dart';

class BuildRegistrationState extends StatelessWidget {
  const BuildRegistrationState({super.key});

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: kpurple400!),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1))
          ]),
      child: Row(children: [
        BuildRegistrationItem(
          count: '0',
          label: 'Student Registered (Today)',
          color: kpurple400!,
          icon: Icons.calendar_today,
        ),
        BuildRegistrationItem(
          count: '0',
          label: 'Student Registered (This Month)',
          color: kpurple400!,
          icon: Icons.date_range,
        ),
        BuildRegistrationItem(
            count: '0',
            label: 'Student Registered (Total)',
            color: kpurple400!,
            icon: Icons.people)
      ]));
}
