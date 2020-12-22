import 'package:animator/data_layer/section.dart';
import 'package:animator/ui_layer/animations/animated_container.dart';
import 'package:animator/ui_layer/animations/animated_opacity.dart';
import 'package:animator/ui_layer/animations/fade_in_image.dart';
import 'package:flutter/material.dart';

// -- Animations --

final animations = <Section>[
  Section(
      title: "AnimatedContainer",
      icon: Icons.score,
      destination: AnimatedContainerWidget()),
  Section(
      title: "FadeInImage",
      icon: Icons.local_movies,
      destination: FadeInImageWidget()),
  Section(
      title: "AnimatedOpacity",
      icon: Icons.settings,
      destination: AnimatedOpacityWidget())
];

// -- Images --

const imageFlutter = "images/flutter_logo.png";