import 'package:flutter/material.dart';

// ENUMS -----------------------------------------------------------------------

enum LocationMiniFAB { LEFT, TOP, RIGHT, BOTTOM }

// CLASSES ---------------------------------------------------------------------

/// A [StatefulWidget] subclass.
class AnimatedMenuWidget extends StatefulWidget {
  @override
  _AnimatedMenuWidgetState createState() => _AnimatedMenuWidgetState();
}

/// A [State] of [AnimatedMenuWidget] subclass.
class _AnimatedMenuWidgetState extends State<AnimatedMenuWidget>
                               with SingleTickerProviderStateMixin {

  // FIELDS --------------------------------------------------------------------

  AnimationController _controller;
  final _duration = const Duration(seconds: 1);
  Animation<double> _animationRotation;
  bool _isCompletedForRotation = false;

  // METHODS -------------------------------------------------------------------

  // -- State --

  @override
  void initState() {
    super.initState();
    _configureAnimation();
  }

  @override
  Widget build(BuildContext context) => Center(child: _getUI());

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // -- Animation --

  void _configureAnimation() {
    _controller = AnimationController(
        vsync: this,
        duration: _duration);

    _animationRotation = Tween<double>(
        begin: 0.0,
        end: 1.0 / 8.0).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.elasticInOut))..addStatusListener((status) {
              switch (status) {
                case AnimationStatus.dismissed:
                  _isCompletedForRotation = false;
                  break;
                case AnimationStatus.forward:
                  // Do anything here
                  break;
                case AnimationStatus.reverse:
                  // Do anything here
                  break;
                case AnimationStatus.completed:
                  _isCompletedForRotation = true;
                  break;
              }
            });
  }

  // -- UI --

  Widget _getUI() {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: [
        _getMiniFAB(LocationMiniFAB.LEFT),
        _getMiniFAB(LocationMiniFAB.TOP),
        _getMiniFAB(LocationMiniFAB.RIGHT),
        _getMiniFAB(LocationMiniFAB.BOTTOM),
        _getNormalFAB()
      ]);
  }

  Widget _getNormalFAB() {
    return RotationTransition(
        turns: _animationRotation,
        child: FloatingActionButton(
            heroTag: 'Normal FAB',
            child: const Icon(Icons.add),
            onPressed: _actionToClickFAB));
  }

  Widget _getMiniFAB(LocationMiniFAB location) {
    Offset end;
    String tag;
    Widget widget;
    switch (location) {
      case LocationMiniFAB.LEFT:
        end = const Offset(-1.2, 0.0);
        tag = location.toString();
        widget = const Icon(Icons.opacity);
        break;
      case LocationMiniFAB.TOP:
        end = const Offset(0.0, -1.2);
        tag = location.toString();
        widget = const Icon(Icons.forward);
        break;
      case LocationMiniFAB.RIGHT:
        end = const Offset(1.2, 0.0);
        tag = location.toString();
        widget = const Icon(Icons.stream);
        break;
      case LocationMiniFAB.BOTTOM:
        end = const Offset(0.0, 1.2);
        tag = location.toString();
        widget = const Icon(Icons.timeline);
        break;
    }

    return SlideTransition(
        position: Tween<Offset>(begin: Offset.zero, end: end)
            .animate(CurvedAnimation(
                parent: _controller,
                curve: Curves.elasticOut)),
        child: FloatingActionButton(
            heroTag: tag,
            mini: true,
            backgroundColor: Colors.lightBlue,
            child: widget,
            onPressed: null));
  }

  // -- Action --

  void _actionToClickFAB() {
    if (!_isCompletedForRotation) _controller.forward();
    else _controller.reverse();
  }
}