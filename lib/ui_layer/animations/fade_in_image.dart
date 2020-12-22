import 'package:animator/data_layer/data.dart';
import 'package:flutter/material.dart';

/// A [StatelessWidget] subclass.
class FadeInImageWidget extends StatelessWidget {

  // FIELDS --------------------------------------------------------------------

  static const _url = "https://avatars0.githubusercontent.com/u/44132125?v=4";

  // METHODS -------------------------------------------------------------------

  // -- StatelessWidget --

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FadeInImage(
            placeholder: AssetImage(imageFlutter),
            image: NetworkImage(_url),
            fadeInCurve: Curves.linear,
            fadeOutCurve: Curves.linear,
            fadeInDuration: const Duration(seconds: 1),
            fadeOutDuration: const Duration(seconds: 1)));
  }
}