import 'package:agent_dashboard/application/presentation/screens/home/widgets/payment_state.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/registration_state.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/search_filteres.dart';
import 'package:agent_dashboard/application/presentation/screens/home/widgets/state_grid.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class BuildDashboardContent extends StatelessWidget {
  const BuildDashboardContent({super.key});

  @override
  Widget build(BuildContext context) => const Column(children: [
        BuildSearchAndFilers(),
        kHeight20,
        BuildStateGrid(),
        kHeight20,
        BuildRegistrationState(),
        kHeight20,
        BuildAndSatatePayments()
      ]);
}
