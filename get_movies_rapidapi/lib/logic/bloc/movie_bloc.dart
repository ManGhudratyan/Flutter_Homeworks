import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_movies_rapidapi/models/movie_model.dart';
import 'package:get_movies_rapidapi/services/movie_service.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(this._movieService) : super(MovieInitial()) {
    on<GetMovieEvent>(_mapGetMovieEventToState);
    on<GetSecondMovieEvent>(_mapGetSecondMovieEventToState);
  }

  final MovieService _movieService;

  FutureOr<void> _mapGetMovieEventToState(
      GetMovieEvent event, Emitter<MovieState> emit) async {
    try {
      emit(MovieLoading(state));
      final List<MovieModel> models = await _movieService.getMovies();
      emit(MovieLoaded(models));
    } catch (error) {
      emit(MovieFailed(state, error.toString()));
    }
  }

  FutureOr<void> _mapGetSecondMovieEventToState(
      GetSecondMovieEvent event, Emitter<MovieState> emit) async {
    try {
      emit(SecondMovieLoading(state));
      final List<MovieModel> models = await _movieService.getSecondMovies();
      emit(SecondMovieLoaded(models));
    } catch (error) {
      emit(SecondMovieFailed(state, error.toString()));
    }
  }
}
