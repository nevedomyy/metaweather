import 'package:dio/dio.dart';
import 'package:metaweather/core/services/storage.dart';

import 'end_points.dart';

/// https://pub.dev/packages/dio

class DioConfig {
  static Dio? _dio;

  DioConfig._();

  static Dio instance(AppStorage storage) {
    return _dio ??= Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: 8000,
        receiveTimeout: 5000,
        followRedirects: false,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json, text/plain, */*',
        },
      ),
    );
  }
}
