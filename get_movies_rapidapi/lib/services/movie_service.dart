import 'dart:convert';
import 'package:get_movies_rapidapi/models/movie_model.dart';
import 'package:get_movies_rapidapi/services/api_service.dart';
import 'package:http/http.dart';

class MovieService {
  MovieService(this._apiService);
  final ApiService _apiService;

  Future<List<MovieModel>> getMovies() async {
    final Response response =
        await _apiService.makeRequest(HttpMethod.get, '/titles/x/upcoming');
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      List<dynamic> responseData = jsonDecode(response.body)["results"];
      List<MovieModel> movieList =
          responseData.map((e) => MovieModel.fromJson(e)).toList();
      return movieList;
    }
    throw Exception(
        'Request failed with this status code: ${response.statusCode}');
  }

  Future<List<MovieModel>> getSecondMovies() async {
    final Response response =
        await _apiService.makeRequest(HttpMethod.get, '/titles');
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      List<dynamic> responseData = jsonDecode(response.body)["results"];
      List<MovieModel> movieList =
          responseData.map((json) => MovieModel.fromJson(json)).toList();
      return movieList;
    }
    throw Exception(
        'Request failed with this status code: ${response.statusCode}');
  }
}
