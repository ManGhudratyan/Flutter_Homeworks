import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_movies_api/models/movie_model.dart';
import 'package:get_movies_api/services/movie_service.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(this._movieService) : super(MovieInitial()) {
    on<GetMovies>(_mapGetMovieEventToState);
  }
  final MovieService _movieService;

  FutureOr<void> _mapGetMovieEventToState(
      GetMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading(state));
    final List<MovieModel> models = await _movieService.getMovies();
    emit(MovieLoaded(models));
  }
}
