import 'package:agent_dashboard/application/presentation/screens/home/widgets/payment_state.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/registration_state.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/search_filteres.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/side_bar.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/state_grid.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class BuildDashboardContent extends StatelessWidget {
  const BuildDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 900;
    return Row(children: [
      const Expanded(
          flex: 3,
          child: Column(children: [
            BuildSearchAndFilers(),
            kHeight20,
            BuildStateGrid(),
            kHeight20,
            BuildRegistrationState(),
            kHeight20,
            BuildAndSatatePayments()
          ])),
      kWidth30,
      isSmallScreen ? kEmpty : const Expanded(flex: 1, child: BuildSideBar())
    ]);
  }
}
