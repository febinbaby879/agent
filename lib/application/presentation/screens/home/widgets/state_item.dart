import 'package:agent_dashboard/application/presentation/widgets/number_count.dart';
import 'package:flutter/material.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';

class BuildStatteItem extends StatefulWidget {
  const BuildStatteItem({
    super.key,
    required this.color,
    required this.icon,
    required this.count,
    required this.label,
    required this.onTap,
  });

  final Color color;
  final IconData icon;
  final int count;
  final String label;
  final VoidCallback onTap;

  @override
  State<BuildStatteItem> createState() => _BuildStatteItemState();
}

class _BuildStatteItemState extends State<BuildStatteItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double size = screenWidth * 0.05;
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                    color: widget.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8)),
                child: AnimatedScale(
                    scale: _isHovered ? 1.3 : 1.0,
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
                      style: textStyle1.copyWith(
                          color: _isHovered ? widget.color : Colors.black54),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2)
                ]))
          ])),
    );
  }
}
