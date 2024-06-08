import 'package:flutter/material.dart';
import 'package:get_movies/pages/home_page.dart';
import 'package:get_movies/routes/route_table.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    onGenerateRoute: AppRouter.onGenerateRoute,
  ));
}
