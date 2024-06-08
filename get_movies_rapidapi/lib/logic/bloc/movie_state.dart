part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState({
    this.movies = const <MovieModel>[],
    this.movie,
    this.error,
  });

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
      : super(
            error: initState.error,
            movie: initState.movie,
            movies: initState.movies);
}

final class SecondMovieLoading extends MovieState {
  SecondMovieLoading(MovieState initState)
      : super(movies: initState.movies, movie: initState.movie);
}

final class SecondMovieLoaded extends MovieState {
  const SecondMovieLoaded(List<MovieModel> models) : super(movies: models);
}

final class SecondMovieFailed extends MovieState {
  SecondMovieFailed(MovieState initState, String error)
      : super(
          error: initState.error,
          movie: initState.movie,
          movies: initState.movies,
        );
}
