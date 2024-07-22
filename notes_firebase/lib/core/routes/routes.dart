
import 'package:flutter/material.dart';

import '../../presentation/pages/login/login_page.dart';
import '../../presentation/pages/notes/notes_page.dart';
import '../../presentation/pages/signup/signup_page.dart';

// ignore: avoid_classes_with_only_static_members
class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const LoginPage(),
    '/signup-page': (context) => const SignupPage(),
    '/notes-page': (context) => const NotesPage(),
  };
}
