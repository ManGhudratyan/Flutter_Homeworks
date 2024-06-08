import 'dart:io';
import 'package:http/http.dart' as http;

enum HttpMethod { get, post, put, delete }

class ApiServicePhoto {
  final Uri _uri = Uri(scheme: 'https', host: 'jsonplaceholder.typicode.com');
  final Map<String, String> _headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  Future<http.Response> makeRequest(HttpMethod method,
      {Map<String, String>? headers,
      Object? body,
      String? path,
      String? queryParameters}) async {
    switch (method) {
      case HttpMethod.get:
        return await http.get(
          Uri(
              scheme: _uri.scheme,
              host: _uri.host,
              path: path,
              query: queryParameters),
          headers: _headers..addAll(headers ?? {}),
        );
      case HttpMethod.post:
        return await http.post(
          Uri(
              scheme: _uri.scheme,
              host: _uri.host,
              path: path,
              query: queryParameters),
          headers: _headers,
          body: body,
        );
      case HttpMethod.put:
        return await http.put(
          Uri(
              scheme: _uri.scheme,
              host: _uri.host,
              path: path,
              query: queryParameters),
          headers: _headers,
          body: body,
        );
      case HttpMethod.delete:
        return await http.delete(
          Uri(
              scheme: _uri.scheme,
              host: _uri.host,
              path: path,
              query: queryParameters),
          headers: _headers,
          body: body,
        );
    }
  }
}
