import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:metaweather/core/global/wrapper.dart';
import 'package:metaweather/features/forecast/models/forecast.dart';
import 'package:metaweather/features/forecast/repositories/forecast_repository.dart';

abstract class ForecastNotifier with ChangeNotifier {
  Future<void> fetchForecast({required String cityId});
  Forecast? get forecast;
  bool get isLoading;
}

class ForecastNotifierImpl extends AppChangeNotifier
    implements ForecastNotifier {
  final ForecastRepository repository;
  Forecast? _forecast;

  ForecastNotifierImpl({required this.repository});

  @override
  Future<void> fetchForecast({required String cityId}) async {
    funcWithLoader(() async {
      final data = await repository.fetchForecast(cityId: cityId);
      if (data.object != null) {
        _forecast = data.object;
      } else if (data.errorMessage.isNotEmpty) {
        showSnackBar(data.errorMessage);
      }
    });
  }

  @override
  Forecast? get forecast => _forecast;
}
