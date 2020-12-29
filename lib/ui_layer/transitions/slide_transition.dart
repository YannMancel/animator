import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class SlideTransitionWidget extends StatefulWidget {
  @override
  _SlideTransitionWidgetState createState() => _SlideTransitionWidgetState();
}

/// A [State] of [SlideTransitionWidget] subclass.
class _SlideTransitionWidgetState extends State<SlideTransitionWidget>
                                  with SingleTickerProviderStateMixin {

  // FIELDS --------------------------------------------------------------------

  AnimationController _controller;
  Animation<Offset> _animation;

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
            child: SlideTransition(
                position: _animation,
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
        curve: Curves.elasticIn);

    final tween = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(0.5, 0.0));

    _animation = tween.animate(curvedAnimation);
  }
}