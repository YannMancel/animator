import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class AnimatedPhysicalModelWidget extends StatefulWidget {
  @override
  _AnimatedPhysicalModelWidgetState createState() => _AnimatedPhysicalModelWidgetState();
}

/// A [State] of [AnimatedPhysicalModelWidget] subclass.
class _AnimatedPhysicalModelWidgetState extends State<AnimatedPhysicalModelWidget> {

  // FIELDS --------------------------------------------------------------------

  bool _selected = false;

  // METHODS -------------------------------------------------------------------

  // -- State --

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell( // The onTap call of GestureDetector does not work
            child: AnimatedPhysicalModel(
                child: Container(
                    width: 200.0,
                    height: 200.0),
                shape: BoxShape.rectangle,
                elevation: _selected ? 8.0 : 0.0,
                color: _selected ? Colors.red : Colors.blue,
                shadowColor: _selected ? Colors.grey : Colors.white,
                duration: const Duration(seconds: 1),
                curve: Curves.linear),
            onTap: () => setState(() => _selected = !_selected)));
  }
}