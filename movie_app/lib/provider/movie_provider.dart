import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/service/api_service.dart';

class MovieProvider extends ChangeNotifier {
  MovieProvider(this._apiService);

  final ApiService _apiService;

  Future<List<MovieModel>> getMovies() async {
    http.Response response =
        await _apiService.makeRequest(HttpMethod.get, '/titles/x/upcoming');
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final String body = response.body;
      List<dynamic> decodedData = jsonDecode(body);
      List<MovieModel> movies =
          decodedData.map((value) => MovieModel.fromJson(value)).toList();
      return movies;
    }
    throw Exception('Response failed with status code: ${response.statusCode}');
  }
}
