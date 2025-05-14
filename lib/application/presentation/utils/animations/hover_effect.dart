import 'package:flutter/material.dart';

class HoverEffectWidget extends StatefulWidget {
  const HoverEffectWidget({
    super.key,
    required this.child,
    this.scaleFactor = 1.03,
    this.duration = const Duration(milliseconds: 150),
  });

  final Widget child;
  final double scaleFactor;
  final Duration duration;

  @override
  State<HoverEffectWidget> createState() => _HoverEffectWidgetState();
}

class _HoverEffectWidgetState extends State<HoverEffectWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? widget.scaleFactor : 1.0,
        duration: widget.duration,
        child: widget.child,
      ),
    );
  }
}
