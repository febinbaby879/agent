import 'package:flutter/material.dart';

class MouseHoverSwitcher extends StatefulWidget {
  final Widget child;
  final Widget? hoverChild;

  const MouseHoverSwitcher({
    Key? key,
    required this.child,
    this.hoverChild,
  }) : super(key: key);

  @override
  _MouseHoverSwitcherState createState() => _MouseHoverSwitcherState();
}

class _MouseHoverSwitcherState extends State<MouseHoverSwitcher> {
  bool _isHovered = false;

  void _setHovered(bool hover) {
    setState(() {
      _isHovered = hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: _isHovered ? (widget.hoverChild ?? widget.child) : widget.child,
      ),
    );
  }
}
