import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class KycUpdateActionWidget extends StatelessWidget {
  const KycUpdateActionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(svgFormsPending, height: 200,),
        kHeight20,
        const Text(
          'Complete your KYC details to access the dashboard',
        ),
        kHeight20,
        ElevatedButton(onPressed: () {
          context.go(Routes.onboardingScreen);
        }, child: const Text('Complete KYC'))
      ],
    );
  }
}
