import 'package:animator/data_layer/section.dart';
import 'package:animator/ui_layer/animations/animated_builder.dart';
import 'package:animator/ui_layer/animations/animated_container.dart';
import 'package:animator/ui_layer/animations/animated_cross_fade.dart';
import 'package:animator/ui_layer/animations/animated_default_text_style.dart';
import 'package:animator/ui_layer/animations/animated_list.dart';
import 'package:animator/ui_layer/animations/animated_opacity.dart';
import 'package:animator/ui_layer/animations/animated_physical_model.dart';
import 'package:animator/ui_layer/animations/animated_positioned.dart';
import 'package:animator/ui_layer/animations/animated_size.dart';
import 'package:animator/ui_layer/animations/fade_in_image.dart';
import 'package:animator/ui_layer/animations/hero.dart';
import 'package:animator/ui_layer/transitions/fade_transition.dart';
import 'package:animator/ui_layer/transitions/decoration_box_transition.dart';
import 'package:animator/ui_layer/transitions/positioned_transition.dart';
import 'package:animator/ui_layer/transitions/rotation_transition.dart';
import 'package:animator/ui_layer/transitions/scale_transition.dart';
import 'package:animator/ui_layer/transitions/size_transition.dart';
import 'package:animator/ui_layer/transitions/slide_transition.dart';
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
      title: "AnimatedBuilder",
      icon: Icons.add_alarm_outlined,
      destination: AnimatedBuilderWidget()),
  Section(
      title: "AnimatedPhysicalModel",
      icon: Icons.accessible_forward_outlined,
      destination: AnimatedPhysicalModelWidget()),
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
  Section(
      title: "FadeTransition",
      icon: Icons.forward,
      destination: FadeTransitionWidget()),
  Section(
      title: "PositionedTransition",
      icon: Icons.print,
      destination: PositionedTransitionWidget()),
  Section(
      title: "RotationTransition",
      icon: Icons.sort,
      destination: RotationTransitionWidget()),
  Section(
      title: "ScaleTransition",
      icon: Icons.opacity,
      destination: ScaleTransitionWidget()),
  Section(
      title: "SizeTransition",
      icon: Icons.link,
      destination: SizeTransitionWidget()),
  Section(
      title: "SlideTransition",
      icon: Icons.account_tree,
      destination: SlideTransitionWidget()),
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