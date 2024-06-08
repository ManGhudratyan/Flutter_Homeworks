part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetMoviesEvent extends MovieEvent {}

class GetMovieByIdEvent extends MovieEvent {
 const GetMovieByIdEvent(this.id);

  final int id;
}


