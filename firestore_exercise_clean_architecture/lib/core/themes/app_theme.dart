import 'package:flutter/material.dart';

class AppTheme {
  AppTheme.of(this.context);
  final BuildContext context;

  TextStyle get bodyText => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).colorScheme.primary,
      );
  TextStyle get bodySubTitle => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.primary,
      );

  TextStyle get bodyTitle => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).colorScheme.primary,
      );
}
