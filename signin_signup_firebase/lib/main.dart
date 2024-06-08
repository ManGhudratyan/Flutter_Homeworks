import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signin_signup_firebase/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyB13FNZkpBZiKxHDKG8HSky4IsEiGrM3RY',
      appId: '1:995025610614:android:b734174140ef7df008bc57',
      messagingSenderId: '',
      projectId: 'fir-1e0c1',
      storageBucket: '',
    ),
  );
  runApp(
    const MaterialApp(
      home: LoginPage(),
    ),
  );
}
