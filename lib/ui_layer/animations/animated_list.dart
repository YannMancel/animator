import 'package:animator/data_layer/data.dart' as data;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class AnimatedListWidget extends StatefulWidget {
  @override
  _AnimatedListWidgetState createState() => _AnimatedListWidgetState();
}

/// A [State] of [AnimatedListWidget] subclass.
class _AnimatedListWidgetState extends State<AnimatedListWidget> {

  // FIELDS --------------------------------------------------------------------

  final _key = GlobalKey<AnimatedListState>();
  List<String> _cities = [...data.images];

  // METHODS -------------------------------------------------------------------

  // -- State --

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
            _getList(),
            Positioned(
              bottom: 16.0,
              child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: _actionToInsertItem))
       ]);
  }

  // -- UI --

  Widget _getList() {
    return AnimatedList(
        key: _key,
        initialItemCount: _cities.length,
        itemBuilder: (_, index, animation) =>
            _getTile(index, animation, _cities[index]));
  }

  Widget _getTile(int index, Animation<double> animation, String city) {
    final title = city.split('/').last.split('.').first;
    return SlideTransition(
        position: animation.drive(
            Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero)),
        child: Card(
            margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Row(children: [
                    Container(
                        width: 50.0,
                        height: 50.0,
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Image.asset(city, fit: BoxFit.cover),
                        clipBehavior: Clip.hardEdge),
                    Expanded(child: Text(title)),
                    IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => _actionToRemoveItem(index))
                  ]))));
  }

  // -- Action --

  void _actionToInsertItem() {
    List<String> images = [...data.images];
    _cities.forEach((element) => images.remove(element));

    final index = _cities.length;
    if (images.isNotEmpty) {
      final item = images.first;
      _cities.insert(index, item);
      _key.currentState.insertItem(index);
    }
  }

  void _actionToRemoveItem(int index) {
    final city = _cities[index];
    _cities.removeAt(index);
    _key.currentState.removeItem(
        index,
        (_, animation) => _getTile(index, animation, city));
  }
}