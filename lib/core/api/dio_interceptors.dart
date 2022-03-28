import 'package:dio/dio.dart';
import 'package:metaweather/core/services/logger.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    log.i('${response.requestOptions.path}\n${response.data}');
  }
}
