import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_movies_api/logic/bloc/movie_bloc.dart';
import 'package:get_movies_api/services/api_service.dart';
import 'package:get_movies_api/services/movie_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(MovieService(ApiService()))
        ..add(
          GetMovies(),
        ),
      child: BlocBuilder<MovieBloc, MovieState>(
          builder: (BuildContext context, MovieState state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Movies'),
            ),
            body: state is MovieLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(child: Text(state.movies.toString())));
      }),
    );
  }
}
