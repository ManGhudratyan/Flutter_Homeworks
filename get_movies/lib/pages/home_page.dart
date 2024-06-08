import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_movies/logic/bloc/movie_bloc.dart';
import 'package:get_movies/routes/route_params/movie_detail_route_params.dart';
import 'package:get_movies/services/api_service.dart';
import 'package:get_movies/services/movie_service.dart';
import 'package:get_movies/services/second_movie_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(
          MovieService(ApiService()), SecondMovieService(ApiService()))
        ..add(
          GetMovies(),
        )
        ..add(GetSecondMovies()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<MovieBloc, MovieState>(
          listener: (context, state) {
            if (state is MovieFailed && state.error != null ||
                state is SecondMovieFailed && state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          },
          builder: (BuildContext context, MovieState state) {
            return state is MovieLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset(
                                "assets/images/prime_video.png",
                              ),
                              const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Image.asset("assets/images/main_picture.png"),
                        const SizedBox(
                          height: 12,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Prime ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " - Recommended movies",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.movies.isNotEmpty
                                ? state.movies.length
                                : 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      "/movie-detail",
                                      arguments: MovieDetailRouteParam(
                                          movieBloc: context.read<MovieBloc>(),
                                          index: index),
                                    );
                                  },
                                  child: Container(
                                    child:
                                        state.movies[index].primaryImage != null
                                            ? Image.network(
                                                state.movies[index].primaryImage
                                                        ?.url ??
                                                    "",
                                                height: 180,
                                              )
                                            : Container(
                                                decoration: const BoxDecoration(
                                                    color: Colors.white),
                                                child: Center(
                                                    child: Text(state
                                                            .movies[index]
                                                            .titleText
                                                            ?.text ??
                                                        "No Name")),
                                              ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          children: [
                            Text(
                              "Prime ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " - Top 10 Movies In India",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.secondMovies.isNotEmpty
                                ? state.secondMovies.length
                                : 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      "/movie-detail",
                                      arguments: MovieDetailRouteParam(
                                          movieBloc: context.read<MovieBloc>(),
                                          index: index),
                                    );
                                  },
                                  child: Container(
                                    child: state.secondMovies[index]
                                                .primaryImage !=
                                            null
                                        ? Image.network(
                                            state.secondMovies[index]
                                                    .primaryImage?.url ??
                                                "",
                                            height: 180,
                                          )
                                        : Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white),
                                            child: Center(
                                              child: Text(state
                                                      .secondMovies[index]
                                                      .titleText
                                                      ?.text ??
                                                  "No Name"),
                                            ),
                                          ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
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
      ),
    );
  }
}
