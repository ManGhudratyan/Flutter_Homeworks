import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_movies/logic/bloc/movie_bloc.dart';

class DetailedMovie extends StatelessWidget {
  const DetailedMovie({super.key});

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
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            actions: const <Widget>[
              Icon(
                Icons.person,
                size: 20,
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: state.movie?.primaryImage?.url != null
                    ? Image.network(state.movie?.primaryImage?.url ?? "")
                    : Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Text(state.movie?.titleText?.text ?? "No movie"),
                      ),
              ),
              Text(
                state.movie?.titleText?.text ?? "No movie",
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  color: Colors.white,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.play_arrow),
                      Text("Play Movie"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  color: Colors.grey,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download),
                      Text("Download"),
                    ],
                  ),
                ),
              ),
              const Row(
                children: [
                  Icon(Icons.plus_one_outlined),
                  Icon(Icons.celebration),
                  Icon(Icons.share),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
