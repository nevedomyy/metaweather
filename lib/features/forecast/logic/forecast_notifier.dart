import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:metaweather/features/forecast/models/forecast.dart';
import 'package:metaweather/features/forecast/repositories/forecast_repository.dart';

abstract class ForecastNotifier with ChangeNotifier {
  Future<void> fetchForecast({required String cityId});
  Forecast? get forecast;
  bool get isLoading;
}

class ForecastNotifierImpl with ChangeNotifier implements ForecastNotifier {
  final ForecastRepository repository;
  Forecast? _forecast;
  bool _isLoading = false;

  ForecastNotifierImpl({required this.repository});

  @override
  Future<void> fetchForecast({required String cityId}) async {
    _isLoading = true;
    notifyListeners();
    final data = await repository.fetchForecast(cityId: cityId);
    if (data.object != null) {
      _forecast = data.object;
    } else {
      // TODO: data.errorMessage
    }
    _isLoading = false;
    notifyListeners();
  }

  @override
  Forecast? get forecast => _forecast;

  @override
  bool get isLoading => _isLoading;
}
