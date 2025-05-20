import 'package:agent_dashboard/application/presentation/screens/applications/widgets/student_list.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/state_grid.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) => const Column(
      children: [kHeight5, kHeight20, Expanded(child: TaskDashboardScreen())]);
}
