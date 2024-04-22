import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_movies_api/logic/bloc/movie_bloc.dart';
import 'package:get_movies_api/services/api_service.dart';
import 'package:get_movies_api/services/movie_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(MovieService(ApiService()))
        ..add(
          GetMovies(),
        ),
      child: Scaffold(
        body: BlocConsumer<MovieBloc, MovieState>(
          listener: (context, state) {
            if (state is MovieFailed && state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error!),
              ));
            }
          },
          builder: (BuildContext context, MovieState state) {
            return state is MovieLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(child: Text(state.movies.toString()));
          },
        ),
      ),
    );
  }
}
    