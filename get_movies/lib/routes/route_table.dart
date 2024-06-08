import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_movies/logic/bloc/movie_bloc.dart';
import 'package:get_movies/pages/detailed_movies.dart';
import 'package:get_movies/pages/home_page.dart';
import 'package:get_movies/routes/route_params/movie_detail_route_params.dart';
import 'package:get_movies/services/api_service.dart';
import 'package:get_movies/services/movie_service.dart';
import 'package:get_movies/services/second_movie_service.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings,
      {dynamic arguments}) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MovieBloc(
                MovieService(ApiService()), SecondMovieService(ApiService()))
              ..add(GetMovies())
              ..add(GetSecondMovies()),
            child: const HomePage(),
          ),
        );
      case '/movie-detail':
        final MovieDetailRouteParam movieDetailRouteParam =
            settings.arguments as MovieDetailRouteParam;
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: movieDetailRouteParam.movieBloc
                    ..add(GetMovieByIdEvent(movieDetailRouteParam.index ?? 0)),
                  child: const DetailedMovie(),
                ));
      default:
        throw Exception('Route not found!');
    }
  }
}
