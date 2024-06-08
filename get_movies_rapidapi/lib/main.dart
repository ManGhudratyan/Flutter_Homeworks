import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:get_movies_rapidapi/logic/bloc/movie_bloc.dart';
import 'package:get_movies_rapidapi/pages/movie_page.dart';
import 'package:get_movies_rapidapi/services/api_service.dart';
import 'package:get_movies_rapidapi/services/movie_service.dart';

void _setUpServices() {
  GetIt.instance.registerFactory(() => ApiService());
}

void main() {
  _setUpServices();
  runApp(
    BlocProvider(
      create: (context) => MovieBloc(MovieService(
        GetIt.instance.get<ApiService>(),
      ))
        ..add(GetMovieEvent())
        ..add(GetSecondMovieEvent()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MoviePage(),
      ),
    ),
  );
}
