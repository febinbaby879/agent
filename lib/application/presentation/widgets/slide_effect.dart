import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SlideUpFadeInOnScroll extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final SlideDirection direction;

  const SlideUpFadeInOnScroll({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.offset = 30.0,
    this.direction = SlideDirection.bottom,
  });

  @override
  State<SlideUpFadeInOnScroll> createState() => _SlideUpFadeInOnScrollState();
}

class _SlideUpFadeInOnScrollState extends State<SlideUpFadeInOnScroll>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _opacity = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Offset beginOffset;
    switch (widget.direction) {
      case SlideDirection.left:
        beginOffset = Offset(-widget.offset / 100, 0);
        break;
      case SlideDirection.right:
        beginOffset = Offset(widget.offset / 100, 0);
        break;
      case SlideDirection.top:
        beginOffset = Offset(0, -widget.offset / 100);
        break;
      case SlideDirection.bottom:
      default:
        beginOffset = Offset(0, widget.offset / 100);
        break;
    }

    _offset = Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _triggerAnimation() {
    if (!_hasAnimated) {
      _hasAnimated = true;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: Key(widget.child.hashCode.toString()),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.1) {
            _triggerAnimation();
          }
        },
        child: FadeTransition(
            opacity: _opacity,
            child: SlideTransition(position: _offset, child: widget.child)));
  }
}
