import 'dart:convert';
import 'package:get_movies_api/models/photo_model.dart';
import 'package:get_movies_api/services_for_photos.dart/api_service_photo.dart';
import 'package:http/http.dart';

class PhotoService {
  PhotoService(this._apiServicePhoto);
  final ApiServicePhoto _apiServicePhoto;

  Future<List<PhotoModel>> getPhotos() async {
    final Response response =
        await _apiServicePhoto.makeRequest(HttpMethod.get, path: '/photos');
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final List<dynamic> decodedData = jsonDecode(response.body);
      return decodedData
          .map((dynamic json) => PhotoModel.fromJson(json))
          .toList();
    }
    throw Exception('Response failed. ${response.statusCode}');
  }
}
