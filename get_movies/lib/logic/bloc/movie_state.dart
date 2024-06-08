part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  final List<MovieModel> movies;
  final List<MovieModel> secondMovies;
  final String? error;
  final MovieModel? movie;
  const MovieState({
    this.movie,
    this.movies = const <MovieModel>[],
    this.secondMovies = const <MovieModel>[],
    this.error,
  });
  @override
  List<Object> get props => [movies, secondMovies];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {
  MovieLoading(MovieState initstate)
      : super(movies: initstate.movies, secondMovies: initstate.secondMovies);
}

final class MovieLoaded extends MovieState {
  MovieLoaded(
    List<MovieModel> movies,
    MovieState initstate,
  ) : super(movies: movies, secondMovies: initstate.secondMovies);
}

final class MovieFailed extends MovieState {
  MovieFailed(MovieState initState, String error)
      : super(
          error: error,
          movies: initState.movies,
          secondMovies: initState.secondMovies,
        );
}

final class SecondMovieLoading extends MovieState {
  SecondMovieLoading(MovieState initstate)
      : super(secondMovies: initstate.secondMovies, movies: initstate.movies);
}

final class SecondMovieLoaded extends MovieState {
  SecondMovieLoaded(List<MovieModel> secondMovies, MovieState initstate)
      : super(secondMovies: secondMovies, movies: initstate.movies);
}

final class SecondMovieFailed extends MovieState {
  SecondMovieFailed(MovieState initState, String error)
      : super(
            error: error,
            secondMovies: initState.secondMovies,
            movies: initState.movies);
}

final class MovieDetailLoading extends MovieState {
  MovieDetailLoading(MovieState initState)
      : super(
            movies: initState.movies,
            movie: initState.movie,
            secondMovies: initState.secondMovies);
}

final class MoviesDetailLoaded extends MovieState {
  MoviesDetailLoaded(MovieState initState, MovieModel model)
      : super(
            movie: model,
            movies: initState.movies,
            secondMovies: initState.secondMovies);
}
