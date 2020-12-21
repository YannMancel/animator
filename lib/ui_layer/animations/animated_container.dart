import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class AnimatedContainerWidget extends StatefulWidget {
  @override
  _AnimatedContainerWidgetState createState() => _AnimatedContainerWidgetState();
}

/// A [State] of [AnimatedContainerWidget] subclass.
class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {

  // FIELDS --------------------------------------------------------------------

  bool _selected = false;

  // METHODS -------------------------------------------------------------------

  // -- State --

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
            child: AnimatedContainer(
                width: _selected ? 200.0 : 100.0,
                height: _selected ? 100.0 : 200.0,
                decoration: BoxDecoration(
                  color: _selected ? Colors.red : Colors.blue,
                    borderRadius: BorderRadius.circular(_selected ? 5.0 : 20.0),
                    boxShadow: [
                        BoxShadow(
                            color: _selected
                                ? Colors.redAccent : Colors.blueAccent,
                            offset: Offset(3.0, 0.0),
                            spreadRadius: 2.5,
                            blurRadius: 3.0)
                    ]),
                alignment: _selected
                    ? Alignment.center : AlignmentDirectional.topCenter,
                duration: Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: FlutterLogo(size: 75.0)),
            onTap: () => setState(() => _selected = !_selected)));
  }
}