import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_movies_api/models/movie_model.dart';
import 'package:get_movies_api/services_for_movie/movie_service.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(this._movieService) : super(MovieInitial()) {
    on<GetMoviesEvent>(_mapGetMovieEventToState);
    on<GetMovieByIdEvent>(_mapGetMovieByIdEventToState);
  }
  final MovieService _movieService;

  FutureOr<void> _mapGetMovieEventToState(
      GetMoviesEvent event, Emitter<MovieState> emit) async {
    try {
      emit(MovieLoading(state));
      final List<MovieModel> models = await _movieService.getMovies();
      emit(MovieLoaded(models));
    } catch (e) {
      emit(MovieFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapGetMovieByIdEventToState(
      event, Emitter<MovieState> emit) async {
    try {
      emit(MovieDetailLoading(state));
      final MovieModel model = await _movieService.getMovieById(event.id);
      emit(MovieDetailLoaded(state, model));
    } catch (e) {
      emit(MovieFailed(state, e.toString()));
    }
  }
}
