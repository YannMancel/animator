import 'package:flutter/widgets.dart';

class Section {
   // FIELDS -------------------------------------------------------------------

  String title;
  IconData icon;
  Widget destination;

  // CONSTRUCTORS --------------------------------------------------------------

  Section({
    @required this.title,
    @required this.icon,
    @required this.destination
  }) : assert(title != null),
       assert(icon != null),
       assert(destination != null);
}