import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_users_api/models/user_model.dart';
import 'package:get_users_api/services/api_service.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  UserProvider(this._apiService);

  final ApiService _apiService;

  Future<List<UserModel>> getUsers() async {
    http.Response response =
        await _apiService.makeRequest(HttpMethod.get, '/users');
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final String body = response.body;
      List<dynamic> decodedData = jsonDecode(body);
      List<UserModel> users =
          decodedData.map((value) => UserModel.fromJson(value)).toList();
      return users;
    }
    throw Exception('Response failed with status code: ${response.statusCode}');
  }
}
