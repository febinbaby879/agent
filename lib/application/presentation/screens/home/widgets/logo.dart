import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/container_image.dart';
import 'package:flutter/material.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key, this.textStyle});

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => Row(children: [
        ContainerImage(image: eduGuardianLogo),
        kWidth15,
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('eduGuardian - Agent',
                  style: textStyle ??
                      textHeadStyle1.copyWith(
                          color: kPurple,
                          fontWeight: FontWeight.w900,
                          fontSize: 20))
            ])
      ]);
}
