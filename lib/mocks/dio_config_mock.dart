import 'dart:convert' show json, utf8;

import 'package:dio/dio.dart';
import 'package:metaweather/core/api/end_points.dart';

import 'json.dart';

const jsonResponse = {
  EndPoints.forecast: forecastJson,
};

class DioConfigMock extends HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<dynamic>? requestStream,
    Future<dynamic>? cancelFuture,
  ) async {
    final uriPath = options.uri.path;
    final jsonConstName = jsonResponse[uriPath] ?? '';
    final rawString = json.encode(jsonConstName);
    final bytes = utf8.encode(rawString);

    return ResponseBody.fromBytes(
      bytes,
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
