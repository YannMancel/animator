import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleWidgetState createState() => _AnimatedDefaultTextStyleWidgetState();
}

/// A [State] of [AnimatedDefaultTextStyleWidget] subclass.
class _AnimatedDefaultTextStyleWidgetState extends State<AnimatedDefaultTextStyleWidget> {

  // FIELDS --------------------------------------------------------------------

  bool _selected = false;

  // METHODS -------------------------------------------------------------------

  // -- State --

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
            child: AnimatedDefaultTextStyle(
                child: Text("Flutter"),
                style: _selected
                    ? TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0)
                    : TextStyle(color: Colors.red, fontSize: 80.0),
                duration: Duration(seconds: 1),
                curve: Curves.elasticInOut),
            onTap: () => setState(() => _selected = !_selected)));
  }
}