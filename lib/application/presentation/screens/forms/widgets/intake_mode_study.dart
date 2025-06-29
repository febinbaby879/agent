import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/dropdown_builder.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntakeAndModeOfStudySection extends StatelessWidget {
  const IntakeAndModeOfStudySection({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<ApplicationController>();

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 10 : 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight10,
          Text('Intake Month *', style: textHeadStyle1),
          kHeight10,
          Obx(() => CustomDropDownBuilder(
                onChanged: (month) =>
                    formController.changeIntakeMonth(month ?? ''),
                items: formController.intakeMonths,
                hintText: 'Select Intake Month',
                selectedvalue: formController.selectedIntakeMonth.value,
              )),
          kHeight20,
          Text('Mode of Study *', style: textHeadStyle1),
          kHeight10,
          Obx(() => CustomDropDownBuilder(
                onChanged: (mode) =>
                    formController.changeModeOfStudy(mode ?? ''),
                items: formController.studyModes,
                hintText: 'Select Mode of Study',
                selectedvalue: formController.selectedModeOfStudy.value,
              )),
        ],
      ),
    );
  }
}
