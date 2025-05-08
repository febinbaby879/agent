import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class BuildRegistrationItem extends StatelessWidget {
  const BuildRegistrationItem(
      {super.key,
      required this.color,
      required this.icon,
      required this.count,
      required this.label});

  final Color color;
  final IconData icon;
  final String count;
  final String label;

  @override
  Widget build(BuildContext context) => Expanded(
          child: Row(children: [
        Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(icon, color: color, size: 30)),
        kWidth15,
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(count,
              style: textHeadStyle1.copyWith(
                  fontWeight: FontWeight.w900, fontSize: 20),
              overflow: TextOverflow.ellipsis),
          Text(label, style: textStyle1, overflow: TextOverflow.ellipsis)
        ]))
      ]));
}
