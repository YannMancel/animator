import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A [StatefulWidget] subclass.
class AnimatedBuilderWidget extends StatefulWidget {
  @override
  _AnimatedBuilderWidgetState createState() => _AnimatedBuilderWidgetState();
}

/// A [State] of [AnimatedBuilderWidget] subclass.
class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget>
                                  with SingleTickerProviderStateMixin {

  // FIELDS --------------------------------------------------------------------

  AnimationController _controller;

  // METHODS -------------------------------------------------------------------

  // -- State --

  @override
  void initState() {
    super.initState();
    _configureAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedBuilder(
            animation: _controller,
            child: const FlutterLogo(size: 200.0),
            builder: (context, child) =>
                Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: child)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // -- Animation --

  void _configureAnimation() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3))..repeat();
  }
}