import 'package:agent_dashboard/application/presentation/screens/courses/courses.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class CoursesCard extends StatelessWidget {
  final Program program;

  const CoursesCard({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: kRadius5,
        color: kWhite,
        border: Border.all(color: kpurple400!),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child: Text(program.title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kBlack))),
          IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {})
        ]),
        const SizedBox(height: 8),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.book, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(program.department,
                  style: const TextStyle(color: Colors.grey))
            ]),
        const SizedBox(height: 4),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.school, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(program.school, style: const TextStyle(color: Colors.grey))
            ]),
        const SizedBox(height: 16),
        Column(children: [
          BuildInfoCard(icon: Icons.school, text: program.degreeType),
          BuildInfoCard(icon: Icons.access_time, text: program.duration),
          BuildInfoCard(icon: Icons.calendar_today, text: program.mode),
          BuildInfoCard(
              icon: Icons.euro,
              text: 'Est Tuition Fee\n€ ${program.tuitionFee}'),
          BuildInfoCard(
              icon: Icons.euro, text: 'Est Commission\n€ ${program.commission}')
        ])
      ]),
    );
  }
}

class BuildInfoCard extends StatelessWidget {
  const BuildInfoCard({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Icon(icon, size: 20, color: kpurple400),
        kWidth10,
        Expanded(
          child: Text(text, style: textStyle1),
        )
      ]);
}
