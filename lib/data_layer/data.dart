import 'package:animator/data_layer/section.dart';
import 'package:animator/ui_layer/animations/animated_container.dart';
import 'package:animator/ui_layer/animations/animated_cross_fade.dart';
import 'package:animator/ui_layer/animations/animated_default_text_style.dart';
import 'package:animator/ui_layer/animations/animated_list.dart';
import 'package:animator/ui_layer/animations/animated_opacity.dart';
import 'package:animator/ui_layer/animations/animated_positioned.dart';
import 'package:animator/ui_layer/animations/animated_size.dart';
import 'package:animator/ui_layer/animations/fade_in_image.dart';
import 'package:animator/ui_layer/animations/hero.dart';
import 'package:animator/ui_layer/transitions/decorationBoxTransition.dart';
import 'package:flutter/material.dart';

// -- Animations --

final animations = <Section>[
  Section(
      title: "AnimatedContainer",
      icon: Icons.score,
      destination: AnimatedContainerWidget()),
  Section(
      title: "AnimatedOpacity",
      icon: Icons.settings,
      destination: AnimatedOpacityWidget()),
  Section(
      title: "AnimatedCrossFade",
      icon: Icons.style,
      destination: AnimatedCrossFadeWidget()),
  Section(
      title: "AnimatedDefaultTextStyle",
      icon: Icons.ac_unit_rounded,
      destination: AnimatedDefaultTextStyleWidget()),
  Section(
      title: "AnimatedSize",
      icon: Icons.stream,
      destination: AnimatedSizeWidget()),
  Section(
      title: "AnimatedPositioned",
      icon: Icons.group,
      destination: AnimatedPositionedWidget()),
  Section(
      title: "AnimatedList",
      icon: Icons.timeline,
      destination: AnimatedListWidget()),
  Section(
      title: "FadeInImage",
      icon: Icons.local_movies,
      destination: FadeInImageWidget()),
  Section(
      title: "Hero",
      icon: Icons.height,
      destination: HeroWidget()),
  Section(
      title: "DecoratedBoxTransition",
      icon: Icons.animation,
      destination: DecoratedBoxTransitionWidget()),
];

// -- Images --

const imageFlutter = "images/flutter_logo.png";

const images = <String>[
  'images/Greek Cities/Athens.jpg',
  'images/Greek Cities/Corfou.jpg',
  'images/Greek Cities/Delphi.jpg',
  'images/Greek Cities/Meteores.jpg',
  'images/Greek Cities/Santorin.jpg',
  'images/Greek Cities/Sounion.jpg'
];