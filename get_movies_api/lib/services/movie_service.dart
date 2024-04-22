import 'dart:convert';
import 'package:get_movies_api/models/movie_model.dart';
import 'package:get_movies_api/services/api_service.dart';
import 'package:http/http.dart';

class MovieService {
  MovieService(this._apiService);
  final ApiService _apiService;

  Future<List<MovieModel>> getMovies() async {
    final Response response = await _apiService.makeRequest(HttpMethod.get,
        path: '/titles/x/upcoming');
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final List<dynamic> decodedData = jsonDecode(response.body);
      return decodedData
          .map((dynamic json) => MovieModel.fromJson(json))
          .toList();
    }
    throw Exception('Response failed. ${response.statusCode}');
  }
}
