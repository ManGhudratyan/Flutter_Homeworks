import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_movies/models/movie_model.dart';
import 'package:get_movies/services/movie_service.dart';
import 'package:get_movies/services/second_movie_service.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(this._movieService, this._secondMovieService)
      : super(MovieInitial()) {
    on<GetMovies>(_mapGetMovieEventToState);
    on<GetSecondMovies>(_mapGetSecondMoviesToState);
    on<GetMovieByIdEvent>(_mapGetMovieByIdEventToState);
  }
  final MovieService _movieService;
  final SecondMovieService _secondMovieService;

  FutureOr<void> _mapGetMovieEventToState(
      GetMovies event, Emitter<MovieState> emit) async {
    try {
      emit(MovieLoading(state));
      final List<MovieModel> models = await _movieService.getMovies();
      emit(MovieLoaded(models, state));
    } catch (e) {
      emit(MovieFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapGetSecondMoviesToState(
      GetSecondMovies event, Emitter<MovieState> emit) async {
    try {
      emit(SecondMovieLoading(state));
      final List<MovieModel> slmodels =
          await _secondMovieService.getMovies();
      emit(SecondMovieLoaded(slmodels, state));
    } catch (e) {
      emit(SecondMovieFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapGetMovieByIdEventToState(
      GetMovieByIdEvent event, Emitter<MovieState> emit) async {
    try {
      emit(MovieDetailLoading(state));
      final MovieModel model = await _movieService.getMovieById(event.id);
      emit(MoviesDetailLoaded(state, model));
    } catch (e) {
      emit(MovieFailed(state, e.toString()));
    }
  }
}
