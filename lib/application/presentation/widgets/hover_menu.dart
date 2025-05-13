import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class HoverMenuItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final VoidCallback onTap;

  const HoverMenuItem({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    required this.onTap,
  });

  @override
  State<HoverMenuItem> createState() => _HoverMenuItemState();
}

class _HoverMenuItemState extends State<HoverMenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        //cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
                decoration: BoxDecoration(
                  color: isHovered ? Colors.grey[100] : Colors.transparent,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(children: [
                  Icon(
                    widget.icon,
                    color: widget.iconColor ?? Colors.black87,
                    size: 22,
                  ),
                  kWidth10,
                  Text(widget.text,
                      style: textStyle1.copyWith(
                          color: widget.text == 'LOG-OUT' ? kRed : kBlack))
                ]))));
  }
}
