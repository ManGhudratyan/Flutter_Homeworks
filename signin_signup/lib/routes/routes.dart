import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:signin_signup/db/preferences_service.dart';
import 'package:signin_signup/pages/profile.dart';
import 'package:signin_signup/pages/signin.dart';
import 'package:signin_signup/pages/signup.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (BuildContext context) =>
        SignIn(GetIt.instance.get<PreferenceService>()),
    '/sign-up': (BuildContext context) =>
        SignUp(GetIt.instance.get<PreferenceService>()),
    '/profile': (BuildContext context) => const ProfilePage(),
    '/sign-in': (BuildContext context) =>
        SignIn(GetIt.instance.get<PreferenceService>()),
  };
}
