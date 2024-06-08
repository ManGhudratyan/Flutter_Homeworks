import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_movies_api/logic/bloc/movie_bloc.dart';
import 'package:get_movies_api/pages/home_page.dart';
import 'package:get_movies_api/pages/movie_detail_page.dart';
import 'package:get_movies_api/routes/movie_detail_route.dart';
import 'package:get_movies_api/services_for_movie/api_service.dart';
import 'package:get_movies_api/services_for_movie/movie_service.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings,
      {dynamic arguments}) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MovieBloc(
              MovieService(ApiService()),
            )..add(GetMoviesEvent()),
            child: const HomePage(),
          ),
        );
      case '/post-detail':
        final MovieDetailRoute movieDetailRouteParam =
            settings.arguments as MovieDetailRoute;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: movieDetailRouteParam.movieBloc
              ..add(GetMovieByIdEvent(movieDetailRouteParam.id ?? 0)),
            child: const MovieDetailPage(),
          ),
        );
      default:
        throw Exception('Route not found!');
    }
  }
}