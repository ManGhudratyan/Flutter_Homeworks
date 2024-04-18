import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/service/api_service.dart';
import 'package:provider/provider.dart';

void _setupServices() {
  GetIt.instance.registerFactory(() => ApiService());
}

void main() {
  _setupServices();
  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieProvider(GetIt.instance.get<ApiService>()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ),
  );
}
