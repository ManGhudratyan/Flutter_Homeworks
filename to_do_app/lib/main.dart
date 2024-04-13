import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/pages/home_page.dart';
import 'package:to_do_app/provider/list_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => ListProvider()),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  ));
}
