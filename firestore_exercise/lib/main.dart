import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_exercise/logic/auth/auth_bloc.dart';
import 'package:firestore_exercise/logic/user/user_bloc.dart';
import 'package:firestore_exercise/pages/login_page.dart';
import 'package:firestore_exercise/services/auth_service.dart';
import 'package:firestore_exercise/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAPdwkiN8PYPgaT0EVD5smxxWSosY-DNuA',
      appId: '1:385183977119:android:b90260c206f5628f2d9caa',
      messagingSenderId: '',
      projectId: 'fir-project-8ec61',
      storageBucket: '',
    ),
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            AuthService(),
          ),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(
            UserService(firebaseFirestore: FirebaseFirestore.instance),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    ),
  );
}