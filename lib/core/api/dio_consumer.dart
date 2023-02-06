import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quotes_clean/core/api/api_consumer.dart';
import 'package:quotes_clean/core/api/app_interceptor.dart';
import 'package:quotes_clean/core/api/endpoints.dart';
import 'package:quotes_clean/core/api/status_code.dart';
import 'package:quotes_clean/injector_container.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) =>
              true; //*ignora i certificati
      return client;
    };
    client.options
      ..baseUrl = Endpoints.baseUrl
      ..responseType = ResponseType.plain //*se metto json viene già parsificato
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };

    client.interceptors.add(di.sl<AppInterceptor>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future get(String path, Map<String, dynamic>? queryParameters) async {
    // TODO: implement get
    final response = await client.get(
      path,
      queryParameters: queryParameters,
    );
    return _handleResponseAsJson(response);
  }

  @override
  Future post(String path, Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters) async {
    final response = await client.post(
      path,
      data: body,
      queryParameters: queryParameters,
    );
    return _handleResponseAsJson(response);
  }

  @override
  Future put(String path, Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters) async {
    final response = await client.put(
      path,
      data: body,
      queryParameters: queryParameters,
    );
    return _handleResponseAsJson(response);
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) =>
      jsonDecode(response.data.toString());
}
