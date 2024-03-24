import 'package:flutter/material.dart';
import '../pages/edit.dart';
import '../pages/profile.dart';
import '../pages/signin.dart';
import '../pages/signup.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (BuildContext context) => const SignIn(),
    '/sign-up': (BuildContext context) => const SignUp(),
    '/profile': (BuildContext context) => const ProfilePage(),
    '/sign-in': (BuildContext context) => const SignIn(),
    '/edit-page': (BuildContext context) => const EditPage(),
  };
}
