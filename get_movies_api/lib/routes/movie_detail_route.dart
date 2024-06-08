import 'package:get_movies_api/logic/bloc/movie_bloc.dart';

class MovieDetailRoute {
  MovieDetailRoute({required this.movieBloc, required this.id});

  final MovieBloc movieBloc;
  final int? id;
}
