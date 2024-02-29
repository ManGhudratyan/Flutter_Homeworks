import 'package:flutter/material.dart';
import 'package:signin_signup_profile/pages/profile.dart';
import 'package:signin_signup_profile/pages/signin.dart';
import 'package:signin_signup_profile/pages/signup.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (BuildContext context) => const SignIn(),
    '/profile-page': (BuildContext context) => const ProfilePage(),
    '/sign-up': (BuildContext context) => const SignUp(),
  };
}
