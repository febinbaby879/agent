import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class EventButton extends StatefulWidget {
  const EventButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.hieght,
    this.textColr,
    this.color,
    this.borderRadius,
    this.isBorder = false,
    this.fontSize,
    this.style,
    this.borderColor,
  });

  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? hieght;
  final Color? textColr;
  final Color? color;
  final double? borderRadius;
  final double? fontSize;
  final Color? borderColor;
  final bool isBorder;
  final TextStyle? style;

  @override
  State<EventButton> createState() => _EventButtonState();
}

class _EventButtonState extends State<EventButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: widget.width,
              height: widget.hieght ?? 35,
              decoration: BoxDecoration(
                  boxShadow: isHovered ? boxShadow4 : null,
                  border: widget.isBorder
                      ? Border.all(color: widget.borderColor ?? kBlack)
                      : null,
                  borderRadius: BorderRadius.all(
                      Radius.circular(widget.borderRadius ?? 9)),
                  color: widget.color),
              child: Center(
                  child: Text(widget.text,
                      style: widget.style ??
                          textStyle1.copyWith(
                              fontSize: widget.fontSize ?? 15))))));
}
