import 'package:flutter/material.dart';

extension ScaffoldMessengerOf on String? {
  void showErrorSnackBar(context) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(this ?? 'error'),
        ),
      );
}
