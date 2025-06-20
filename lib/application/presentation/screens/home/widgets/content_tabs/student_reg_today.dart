import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/custom_listview_builder.dart';
import 'package:flutter/material.dart';

class StudentRegToday extends StatelessWidget {
  const StudentRegToday({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListview(
      itemBuilder: ({required context, required index}) {
        return kEmpty;
      },
      itemCount: 10,
    );
  }
}
