// ignore_for_file: strict_raw_type

import 'package:flutter/material.dart';

extension ScaffoldMessengerOf on String? {
  // ignore: type_annotate_public_apis
  void showErrorSnackBar(context) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(this ?? 'error'),
        ),
      );
}
