import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:signin_signup/db/preferences_service.dart';
import 'package:signin_signup/routes/routes.dart';

Future<void> _setupSerivces() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  GetIt.instance.registerFactory(() => PreferenceService(preferences));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupSerivces();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: Routes.routes,
  ));
}
