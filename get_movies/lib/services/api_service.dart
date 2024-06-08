import "dart:io";

import "package:http/http.dart" as http;

enum HttpMethod { post, get, put, delete }

class ApiService {
  final Uri _uri = Uri(scheme: "https", host: "moviesdatabase.p.rapidapi.com");
  final Map<String, String> _headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    "X-RapidAPI-Key": "6fa941a4d6msh0ae310bb0051061p16b8b8jsnebe1c2ce041f",
    "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
  };

  Future<http.Response> getResponse(HttpMethod method,
      {String? path,
      Map<String, String>? headers,
      String? query,
      Object? body}) async {
    switch (method) {
      case HttpMethod.get:
        return await http.get(
          Uri(host: _uri.host, scheme: _uri.scheme, path: path, query: query),
          headers: _headers..addAll(headers ?? {}),
        );
      case HttpMethod.put:
        return await http.put(
            Uri(host: _uri.host, scheme: _uri.scheme, path: path, query: query),
            headers: _headers..addAll(headers ?? {}),
            body: body);
      case HttpMethod.post:
        return await http.post(
            Uri(host: _uri.host, scheme: _uri.scheme, path: path, query: query),
            headers: _headers..addAll(headers ?? {}),
            body: body);
      case HttpMethod.delete:
        return await http.delete(
            Uri(host: _uri.host, scheme: _uri.scheme, path: path, query: query),
            headers: _headers..addAll(headers ?? {}),
            body: body);
    }
  }
}
