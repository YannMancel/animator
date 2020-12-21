import 'package:animator/data_layer/data.dart' as data;
import 'package:animator/data_layer/section.dart';
import 'package:flutter/material.dart';

/// A [StatefulWidget] subclass.
class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

/// A [State] of [HomePage] subclass.
class _HomePageState extends State<HomePage> {

  // METHODS -------------------------------------------------------------------

  // -- State --

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0)),
                child: Image.asset(data.imageFlutter)),
            title: Text(widget.title)),
        body: _getListView());
  }

  // -- UI --

  Widget _getListView() {
    return ListView.separated(
      separatorBuilder: (_, __) => _getDivider(),
      itemCount: data.animations.length,
      itemBuilder: (_, index) => _getTile(data.animations[index]));
  }

  Widget _getDivider() {
    return Divider(
      color: Colors.purple,
      indent: 16.0,
      endIndent: 16.0);
  }

  Widget _getTile(Section section) {
    return ListTile(
      leading: Icon(section.icon),
      title: Text(section.title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => _navigateToDestinationFromSection(section),
    );
  }
  
  // -- Navigation --

  void _navigateToDestinationFromSection(Section section) {
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text(section.title)),
        body: section.destination)));
  }
}