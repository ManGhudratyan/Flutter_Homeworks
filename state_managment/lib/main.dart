import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:state_managment/db/preferences_service.dart';
import 'package:state_managment/routes/routes.dart';

import 'state/user_state.dart';

Future<void> _setupSerivces() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  GetIt.instance.registerFactory(() => PreferenceService(preferences));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupSerivces();
  runApp(UserStateWidget(
    preferenceService: GetIt.instance.get<PreferenceService>(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
    ),
  ));
}
