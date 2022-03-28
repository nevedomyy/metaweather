import 'package:dio/dio.dart';
import 'package:metaweather/features/forecast/models/forecast.dart';
import 'package:retrofit/retrofit.dart';

import 'end_points.dart';

part 'api_provider.g.dart';

/// https://pub.dev/packages/retrofit

@RestApi()
abstract class ApiProvider {
  factory ApiProvider(Dio dio) = _ApiProvider;

  @GET('${EndPoints.forecast}/{cityId}')
  Future<Forecast> fetchForecast(
    @Path('cityId') String cityId,
  );
}
