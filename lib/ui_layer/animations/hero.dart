import 'package:animator/data_layer/data.dart' as data;
import 'package:flutter/material.dart';

/// A [StatelessWidget] subclass.
class HeroWidget extends StatelessWidget {

  // METHODS -------------------------------------------------------------------

  // -- StatelessWidget --

  @override
  Widget build(BuildContext context) => _getList();

  // -- UI --

  Widget _getList() {
    return ListView.separated(
        separatorBuilder: (_, __) => _getDivider(),
        itemCount: data.images.length,
        itemBuilder: (context, index) => _getTile(context, data.images[index]));
  }

  Widget _getDivider() {
    return const Divider(
        color: Colors.purple,
        indent: 82.0,
        endIndent: 16.0);
  }

  Widget _getTile(BuildContext context, String item) {
    final title = item.split('/').last.split('.').first;
    return ListTile(
      leading: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0)),
        child: Hero(
            tag: title,
            child: Image.asset(item, fit: BoxFit.cover)),
        clipBehavior: Clip.hardEdge),
      title: Text(title),
      onTap: () => _navigateToDetail(context, item, title));
  }

  // -- Navigation --

  void _navigateToDetail(BuildContext context, String item, String title) {
    Navigator.push(context, MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(title: Text(title)),
            body: Hero(
                tag: title,
                child: Image.asset(item, fit: BoxFit.cover)))));
  }
}