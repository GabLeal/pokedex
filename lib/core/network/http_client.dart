// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/network/http_client_interface.dart';
import 'package:pokedex/core/network/http_response.dart';

class HttpClient implements IHttpClient {
  final Dio _httpClient;

  HttpClient(this._httpClient);

  @override
  Future<HttpResponse> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    try {
      var response = await _httpClient.get(
        url,
        options: Options(headers: headers),
      );

      return HttpResponse(
        url: url,
        body: response.data,
        statusCode: response.statusCode!,
      );
    } catch (exception) {
      log(exception.toString());
      throw InternalServerFailure();
    }
  }

  @override
  Future<HttpResponse> post(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _httpClient.post(
        url,
        data: body,
        options: Options(
          headers: headers,
        ),
      );

      return HttpResponse(
        url: url,
        body: response.data,
        statusCode: response.statusCode!,
      );
    } catch (exception) {
      throw InternalServerFailure();
    }
  }

  @override
  Future<HttpResponse> delete(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _httpClient.delete(
        url,
        data: body,
        options: Options(
          headers: headers,
        ),
      );

      return HttpResponse(
        url: url,
        body: response.data,
        statusCode: response.statusCode!,
      );
    } catch (exception) {
      throw InternalServerFailure(message: exception.toString());
    }
  }

  @override
  Future<HttpResponse> patch(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _httpClient.patch(
        url,
        data: body,
        options: Options(
          headers: headers,
        ),
      );

      return HttpResponse(
        url: url,
        body: response.data,
        statusCode: response.statusCode!,
      );
    } catch (exception) {
      throw InternalServerFailure(message: exception.toString());
    }
  }

  @override
  Future<HttpResponse> put(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _httpClient.put(
        url,
        data: body,
        options: Options(
          headers: headers,
        ),
      );

      return HttpResponse(
        url: url,
        body: response.data,
        statusCode: response.statusCode!,
      );
    } catch (exception) {
      throw InternalServerFailure(message: exception.toString());
    }
  }
}
