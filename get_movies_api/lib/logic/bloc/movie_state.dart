part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState({this.movies = const <MovieModel>[], this.error});

  final List<MovieModel> movies;
  final String? error;

  @override
  List<Object> get props => [movies];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {
  MovieLoading(MovieState initState)
      : super(movies: initState.movies); //popoxutyun chi ene
}

final class MovieLoaded extends MovieState {
  const MovieLoaded(List<MovieModel> models) : super(movies: models);
}

final class MovieFailed extends MovieState {
  MovieFailed(MovieState initState, String error)
      : super(
          error: error,
          movies: initState.movies,
        );
}
