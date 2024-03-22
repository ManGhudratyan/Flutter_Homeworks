import 'package:flutter/material.dart';

enum Logos {
  // ignore: constant_identifier_names
  facebook_f,
  apple,
}

class Logo extends StatelessWidget {
  final Logos logo;

  const Logo(this.logo, {super.key});

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    switch (logo) {
      case Logos.facebook_f:
        iconData = Icons.facebook;
        break;
      case Logos.apple:
        iconData = Icons.apple;
        break;
    }

    return Icon(iconData);
  }
}
