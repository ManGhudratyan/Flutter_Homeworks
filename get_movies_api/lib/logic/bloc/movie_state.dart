part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState(
      {this.movies = const <MovieModel>[], this.error, this.movie});

  final List<MovieModel> movies;
  final MovieModel? movie;
  final String? error;

  @override
  List<Object?> get props => [movies, movie, error];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {
  MovieLoading(MovieState initState)
      : super(movies: initState.movies, movie: initState.movie);
}

final class MovieLoaded extends MovieState {
  const MovieLoaded(List<MovieModel> models) : super(movies: models);
}

final class MovieFailed extends MovieState {
  MovieFailed(MovieState initState, String error)
      : super(error: error, movies: initState.movies, movie: initState.movie);
}

final class MovieDetailLoading extends MovieState {
  MovieDetailLoading(MovieState initState)
      : super(movies: initState.movies, movie: initState.movie);
}

final class MovieDetailLoaded extends MovieState {
  MovieDetailLoaded(MovieState initState, MovieModel model)
      : super(movie: model, movies: initState.movies);
}
