import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class FadeTransitionWidget extends StatefulWidget {
  @override
  _FadeTransitionWidgetState createState() => _FadeTransitionWidgetState();
}

/// A [State] of [FadeTransitionWidget] subclass.
class _FadeTransitionWidgetState extends State<FadeTransitionWidget>
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
            child: FadeTransition(
                opacity: _animation,
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
        duration: const Duration(seconds: 1));

    final curvedAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn);

    final tween = Tween<double>(begin: 0.2, end: 1.0);

    _animation = tween.animate(curvedAnimation);
  }
}