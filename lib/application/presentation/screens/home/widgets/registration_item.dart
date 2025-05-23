import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/number_count.dart';
import 'package:flutter/material.dart';

class BuildRegistrationItem extends StatefulWidget {
  const BuildRegistrationItem(
      {super.key,
      required this.color,
      required this.icon,
      required this.count,
      required this.label});

  final Color color;
  final IconData icon;
  final int count;
  final String label;

  @override
  State<BuildRegistrationItem> createState() => _BuildRegistrationItemState();
}

class _BuildRegistrationItemState extends State<BuildRegistrationItem> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double size = screenWidth * 0.05;
    return Expanded(
        child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                      color: widget.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30)),
                  child: AnimatedScale(
                      scale: _isHovered ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(widget.icon,
                          color: widget.color, size: size * 0.5))),
              kWidth15,
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    AnimatedCounter(target: widget.count),
                    Text(widget.label,
                        style: textStyle1, overflow: TextOverflow.ellipsis)
                  ]))
            ])));
  }
}
