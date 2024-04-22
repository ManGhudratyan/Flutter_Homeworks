import 'dart:io';
import 'package:http/http.dart' as http;

enum HttpMethod { get, post, put, delete }

class ApiService {
  final Uri _uri = Uri(scheme: 'https', host: 'moviesdatabase.p.rapidapi.com');
  final Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    "X-RapidAPI-Key": "6fa941a4d6msh0ae310bb0051061p16b8b8jsnebe1c2ce041f",
    "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
  };
  Future<http.Response> makeRequest(HttpMethod method,
      {Map<String, String>? headers,
      Object? body,
      String? path,
      String? queryParameters}) async {
    switch (method) {
      case HttpMethod.get:
        return await http.get(
          Uri(scheme: _uri.scheme, host: _uri.host, query: queryParameters),
          headers: headers,
        );
      case HttpMethod.post:
        return await http.post(
          Uri(scheme: _uri.scheme, host: _uri.host, query: queryParameters),
          headers: headers,
          body: body,
        );
      case HttpMethod.put:
        return await http.put(
          Uri(scheme: _uri.scheme, host: _uri.host, query: queryParameters),
          headers: headers,
          body: body,
        );
      case HttpMethod.delete:
        return await http.delete(
          Uri(scheme: _uri.scheme, host: _uri.host, query: queryParameters),
          headers: headers,
          body: body,
        );
    }
  }
}
