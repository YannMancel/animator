import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class AnimatedCrossFadeWidget extends StatefulWidget {
  @override
  _AnimatedCrossFadeWidgetState createState() => _AnimatedCrossFadeWidgetState();
}

/// A [State] of [AnimatedCrossFadeWidget] subclass.
class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {

  // FIELDS --------------------------------------------------------------------

  bool _selected = false;

  // METHODS -------------------------------------------------------------------

  // -- State --

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
            child: AnimatedCrossFade(
                firstChild: const FlutterLogo(
                    style: FlutterLogoStyle.horizontal, size: 100.0),
                secondChild: const FlutterLogo(
                    style: FlutterLogoStyle.stacked, size: 100.0),
                crossFadeState: _selected
                    ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: Duration(seconds: 1),
              firstCurve: Curves.linear,
              secondCurve: Curves.linear),
            onTap: () => setState(() => _selected = !_selected)));
  }
}