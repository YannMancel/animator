import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class AnimatedSizeWidget extends StatefulWidget {
  @override
  _AnimatedSizeWidgetState createState() => _AnimatedSizeWidgetState();
}

/// A [State] of [AnimatedSizeWidget] subclass.
class _AnimatedSizeWidgetState extends State<AnimatedSizeWidget>
                               with SingleTickerProviderStateMixin {

  // FIELDS --------------------------------------------------------------------

  bool _selected = false;

  // METHODS -------------------------------------------------------------------

  // -- State --

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
            child: AnimatedSize(
                duration: const Duration(seconds: 1),
                vsync: this,
                curve: Curves.easeIn,
                child: FlutterLogo(size: _selected ? 100.0 : 250.0)),
            onTap: () => setState(() => _selected = !_selected)));
  }
}