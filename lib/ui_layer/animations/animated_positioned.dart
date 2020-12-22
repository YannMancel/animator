import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class AnimatedPositionedWidget extends StatefulWidget {
  @override
  _AnimatedPositionedWidgetState createState() => _AnimatedPositionedWidgetState();
}

/// A [State] of [AnimatedPositionedWidget] subclass.
class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget>
                               with SingleTickerProviderStateMixin {

  // FIELDS --------------------------------------------------------------------

  bool _selected = false;

  // METHODS -------------------------------------------------------------------

  // -- State --

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
        child: GestureDetector(
            child: Stack(children: [
                AnimatedPositioned(
                    child: const FlutterLogo(size: 200.0),
                    top: _selected ? (size.height / 2.0 - 100.0) : 0.0,
                    right: _selected ? (size.width / 2.0 - 100.0) : 0.0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn)
            ]),
            onTap: () => setState(() => _selected = !_selected)));
  }
}