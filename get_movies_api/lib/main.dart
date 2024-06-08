import 'package:flutter/material.dart';
import 'package:get_movies_api/routes/routes.dart';

void main() {
  runApp(const MaterialApp(
    onGenerateRoute: AppRouter.onGenerateRoute,
  ));
}