import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_movies_api/logic/bloc/movie_bloc.dart';
import 'package:get_movies_api/models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel? movie;

  const MovieDetailPage({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      listener: (context, state) {
        if (state is MovieFailed && state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error!),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: state is MovieDetailLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(movie!.originalTitleText.toString()),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
