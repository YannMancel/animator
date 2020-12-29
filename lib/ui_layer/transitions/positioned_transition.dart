import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class PositionedTransitionWidget extends StatefulWidget {
  @override
  _PositionedTransitionWidgetState createState() => _PositionedTransitionWidgetState();
}

/// A [State] of [PositionedTransitionWidget] subclass.
class _PositionedTransitionWidgetState extends State<PositionedTransitionWidget>
                                       with SingleTickerProviderStateMixin {

  // FIELDS --------------------------------------------------------------------

  AnimationController _controller;
  Animation<RelativeRect> _animation;

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
            child: Stack(children: [
              PositionedTransition(
                  rect: _animation,
                  child: const FlutterLogo(size: 200.0))
            ]),
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
        curve: Curves.elasticInOut);

    final tween = RelativeRectTween(
        begin: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
        end: const RelativeRect.fromLTRB(200.0, 200.0, 0.0, 0.0));

    _animation = tween.animate(curvedAnimation);
  }
}