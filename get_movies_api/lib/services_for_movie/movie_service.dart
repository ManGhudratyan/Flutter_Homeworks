import 'dart:convert';
import 'dart:io';
import 'package:get_movies_api/models/movie_model.dart';
import 'package:get_movies_api/services_for_movie/api_service.dart';
import 'package:http/http.dart';

class MovieService {
  MovieService(this._apiService);
  final ApiService _apiService;

  Future<List<MovieModel>> getMovies() async {
    final Response response =
        await _apiService.makeRequest(HttpMethod.get, '/titles/x/upcoming');
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final List<dynamic> decodedData = jsonDecode(response.body)["results"];
      return decodedData
          .map((dynamic json) => MovieModel.fromJson(json))
          .toList();
    }
    throw Exception('Response failed. ${response.statusCode}');
  }

  Future<MovieModel> getMovieById(int id) async {
    final Response response =
        await _apiService.makeRequest(HttpMethod.get, '/posts/$id');
    if (response.statusCode >= HttpStatus.ok &&
        response.statusCode <= HttpStatus.multipleChoices) {
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Reponse failed. Status code: ${response.statusCode}');
  }

  Future<void> deletePostById(int id) async {
    final Response response =
        await _apiService.makeRequest(HttpMethod.delete, '/posts/$id');
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Reponse failed. Status code: ${response.statusCode}');
    }
  }
}
