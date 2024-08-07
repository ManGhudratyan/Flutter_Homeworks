import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/routes.dart';
import 'data/services/user_service/user_service_imp.dart';
import 'presentation/logic/bloc/auth_bloc.dart';

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
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        UserServiceImp(FirebaseFirestore.instance),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
      ),
    ),
  );
}
