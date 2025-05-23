import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedCounter extends StatefulWidget {
  final int target;
  final TextStyle? style;
  final Duration stepDuration;

  const AnimatedCounter({
    super.key,
    required this.target,
    this.style,
    this.stepDuration = const Duration(milliseconds: 50),
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> {
  int _current = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCounting();
  }

  void _startCounting() {
    _timer?.cancel();
    _current = 0;

    _timer = Timer.periodic(widget.stepDuration, (timer) {
      if (_current >= widget.target) {
        timer.cancel();
      } else {
        setState(() => _current++);
      }
    });
  }

  @override
  void didUpdateWidget(covariant AnimatedCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.target != widget.target) {
      _startCounting();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Text('$_current',
      style: widget.style ?? textHeadStyle1.copyWith(fontSize: 20));
}
