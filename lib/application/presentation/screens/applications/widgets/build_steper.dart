import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class BuildStepper extends StatelessWidget {
  const BuildStepper(
      {super.key, required this.activeStep, required this.stepTitles});

  final int activeStep;
  final List<String> stepTitles;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 120),
      Stack(alignment: Alignment.centerLeft, children: [
        Positioned(
            left: 30,
            top: 0,
            bottom: 0,
            child: Container(width: 2, color: kWhite)),
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                stepTitles.length,
                (index) => StepLabel(
                    index: index,
                    isActive: index == activeStep,
                    stepTitle: stepTitles[index],
                    activeStep: activeStep)))
      ])
    ]);
  }
}

class StepLabel extends StatelessWidget {
  const StepLabel({
    super.key,
    required this.isActive,
    required this.index,
    required this.activeStep,
    required this.stepTitle,
  });

  final bool isActive;
  final int index;
  final int activeStep;
  final String stepTitle;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      kWidth15,
      Container(
          margin: const EdgeInsets.only(top: 30),
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: isActive ? kRed : kPurple),
          child: Text('${index + 1}',
              style: TextStyle(
                  color: kWhite,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal))),
      kWidth15,
      Text(stepTitle,
          style: TextStyle(
              color: kWhite,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal))
    ]);
  }
}
