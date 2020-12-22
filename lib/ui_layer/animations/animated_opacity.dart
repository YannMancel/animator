import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class AnimatedOpacityWidget extends StatefulWidget {
  @override
  _AnimatedOpacityWidgetState createState() => _AnimatedOpacityWidgetState();
}

/// A [State] of [AnimatedOpacityWidget] subclass.
class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {

  // FIELDS --------------------------------------------------------------------

  bool _selected = false;

  // METHODS -------------------------------------------------------------------

  // -- State --

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
            child: AnimatedOpacity(
                opacity: _selected ? 1.0 : 0.3,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: const FlutterLogo(size: 200.0)),
            onTap: () => setState(() => _selected = !_selected)));
  }
}