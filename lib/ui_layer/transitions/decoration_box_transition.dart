import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class DecoratedBoxTransitionWidget extends StatefulWidget {
  @override
  _DecoratedBoxTransitionWidgetState createState() => _DecoratedBoxTransitionWidgetState();
}

/// A [State] of [DecoratedBoxTransitionWidget] subclass.
class _DecoratedBoxTransitionWidgetState extends State<DecoratedBoxTransitionWidget>
                                         with SingleTickerProviderStateMixin {

  // FIELDS --------------------------------------------------------------------

  AnimationController _controller;
  Animation<Decoration> _animation;

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
            child: DecoratedBoxTransition(
                decoration: _animation,
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
        curve: Curves.elasticInOut);

    final decorationTween = DecorationTween(
        begin: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(15.0)),
        end: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(100.0)));

    _animation = decorationTween.animate(curvedAnimation);
  }
}