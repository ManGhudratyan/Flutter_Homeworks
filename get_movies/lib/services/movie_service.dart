import 'dart:convert';

import 'package:get_movies/models/movie_model.dart';
import 'package:get_movies/services/api_service.dart';
import 'package:http/http.dart';

class MovieService {
  final ApiService apiService;

  MovieService(this.apiService);

  Future<List<MovieModel>> getMovies() async {
    final Response response = await apiService.getResponse(HttpMethod.get,
        path: "/titles/x/upcoming");
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      List<dynamic> decodedData = jsonDecode(response.body)["results"];
      return decodedData.map((dynamic e) => MovieModel.fromJson(e)).toList();
    }
    throw ("Response failed with this status code ${response.statusCode}.");
  }

  Future<MovieModel> getMovieById(int id) async {
    List<MovieModel> data = await getMovies();
    return data[id];
  }
}
