import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_movies_api/logic/bloc/movie_bloc.dart';
import 'package:get_movies_api/pages/movie_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: BlocConsumer<MovieBloc, MovieState>(
        listener: (context, state) {
          if (state is MovieFailed && state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
              ),
            );
          }
        },
        builder: (BuildContext context, MovieState state) {
          if (state is MovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        var movie = state.movies[index];
                        if (movie.primaryImage?.url != null &&
                            movie.primaryImage!.url!.isNotEmpty) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetailPage(movie: movie),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 200,
                                height: 300,
                                child: Image.network(
                                  movie.primaryImage!.url!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  // Other widgets
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Find',
          ),
        ],
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
      ),
    );
  }
}
