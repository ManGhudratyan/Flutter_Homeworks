import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_movies_rapidapi/logic/bloc/movie_bloc.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      listener: (context, state) {
        if (state is MovieFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieLoaded) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Image.asset(
                'assets/images/prime_video.png',
                width: 77.98,
                height: 40,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Image.asset('assets/images/first_picture.png'),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          'Prime ',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '- Recommended movies',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movies.length,
                          itemBuilder: (BuildContext context, int index) {
                            var movie = state.movies[index];
                            if (movie.primaryImageModel?.url != null &&
                                movie.primaryImageModel!.url!.isNotEmpty) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 200,
                                  height: 300,
                                  child: Image.network(
                                    movie.primaryImageModel!.url!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }
                            return Container();
                          }),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
