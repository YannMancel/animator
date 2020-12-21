import 'package:animator/data_layer/section.dart';
import 'package:animator/ui_layer/animations/animated_container.dart';
import 'package:flutter/material.dart';

// -- Animations --

final animations = <Section> [
  Section(
      title: "AnimatedContainer",
      icon: Icons.score,
      destination: AnimatedContainerWidget()),
  Section(title: "test", icon: Icons.title, destination: Container(color: Colors.blue)),
  Section(title: "bla", icon: Icons.settings, destination: Container(color: Colors.green))
];

// -- Images --

const imageFlutter = "images/flutter_logo.png";