import 'dart:io' show Platform;

import 'package:dio/dio.dart';
import 'package:metaweather/core/api/dio_interceptors.dart';
import 'package:metaweather/core/services/storage.dart';
import 'package:metaweather/mocks/dio_config_mock.dart';

import 'end_points.dart';

/// https://pub.dev/packages/dio

class DioConfig {
  static Dio? _dio;

  DioConfig._();

  static Dio instance(AppStorage storage) {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: EndPoints.baseUrl,
          connectTimeout: 8000,
          receiveTimeout: 5000,
        ),
      );

      _dio!.interceptors.add(
        LoggerInterceptor(),
      );

      if (Platform.environment.containsKey('FLUTTER_TEST')) {
        _dio!.httpClientAdapter = DioConfigMock();
      }
    }
    return _dio!;
  }
}
