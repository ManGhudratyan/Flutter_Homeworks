part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState({this.movies = const <MovieModel>[]});

  final List<MovieModel> movies;

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
