import 'package:metaweather/core/api/api_provider.dart';
import 'package:metaweather/core/global/wrapper.dart';
import 'package:metaweather/core/models/app_response.dart';
import 'package:metaweather/core/services/storage.dart';

abstract class ForecastRepository {
  Future<AppResponse> fetchForecast({required String cityId});
}

class ForecastRepositoryImpl implements ForecastRepository {
  final ApiProvider apiProvider;
  final AppStorage storage;

  ForecastRepositoryImpl({
    required this.apiProvider,
    required this.storage,
  });

  @override
  Future<AppResponse> fetchForecast({required String cityId}) async {
    return await tryCatchResponse(() async {
      return await apiProvider.fetchForecast(cityId);
    });
  }
}
