import 'package:agent_dashboard/application/presentation/screens/home/widgets/state_item.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:flutter/material.dart';

class BuildAndSatatePayments extends StatelessWidget {
  const BuildAndSatatePayments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
              flex: 1,
              child: BuildStatteItem(
                  onTap: () {},
                  count: '0',
                  label: 'Visas Approved',
                  color: kpurple400!,
                  icon: Icons.check_circle_outline)),
          const SizedBox(width: 16),
          Expanded(
              flex: 1,
              child: BuildStatteItem(
                  onTap: () {},
                  count: '0',
                  label: 'Visas Rejected',
                  color: kpurple400!,
                  icon: Icons.cancel_outlined)),
          const SizedBox(width: 16),
          Expanded(
              flex: 1,
              child: BuildStatteItem(
                  onTap: () {},
                  count: '0',
                  label: 'Payments',
                  color: kpurple400!,
                  icon: Icons.payments_outlined))
        ]));
  }
}
