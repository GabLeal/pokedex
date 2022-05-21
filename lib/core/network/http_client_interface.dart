import 'package:pokedex/core/network/http_response.dart';

abstract class IHttpClient {
  Future<HttpResponse> get(
    String url, {
    Map<String, String>? headers,
  });

  Future<HttpResponse> post(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });

  Future<HttpResponse> put(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });

  Future<HttpResponse> patch(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });

  Future<HttpResponse> delete(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });
}
