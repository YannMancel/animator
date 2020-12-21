import 'package:animator/ui_layer/pages/home_page.dart';
import 'package:flutter/material.dart';

/// A [StatelessWidget] subclass.
class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Animator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: HomePage(title: 'Animator'));
  }
}