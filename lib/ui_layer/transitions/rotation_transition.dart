import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class RotationTransitionWidget extends StatefulWidget {
  @override
  _RotationTransitionWidgetState createState() => _RotationTransitionWidgetState();
}

/// A [State] of [RotationTransitionWidget] subclass.
class _RotationTransitionWidgetState extends State<RotationTransitionWidget>
                                     with SingleTickerProviderStateMixin {

  // FIELDS --------------------------------------------------------------------

  AnimationController _controller;
  Animation<double> _animation;

  bool _selected = false;

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
        child: GestureDetector(
            child: RotationTransition(
                turns: _animation,
                child: const FlutterLogo(size: 200.0)),
            onTap: () => setState(() {
              _selected = !_selected;
              (_selected) ? _controller.forward() : _controller.reverse();
            })));
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
        duration: const Duration(seconds: 2));

    final curvedAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut);

    final tween = Tween<double>(begin: 0.0, end: 1.0);

    _animation = tween.animate(curvedAnimation);
  }
}