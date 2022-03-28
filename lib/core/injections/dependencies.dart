import 'package:dio/dio.dart' show Dio;
import 'package:flutter/material.dart';
import 'package:metaweather/core/api/api_provider.dart';
import 'package:metaweather/core/api/dio_config.dart';
import 'package:metaweather/core/global/keys.dart';
import 'package:metaweather/core/services/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependencies extends InheritedWidget {
  late final SharedPreferences _prefs;
  late final ApiProvider _apiProvider;
  late final AppStorage _storage;
  late final String _cityId;
  late final Dio _dio;

  AppDependencies({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _storage = AppStorageImpl(prefs: _prefs);
    _dio = DioConfig.instance(_storage);
    _apiProvider = ApiProvider(_dio);

    _cityId = await _storage.getData(Keys.cityId);
  }

  void dispose() {
    _dio.close();
  }

  static AppDependencies of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppDependencies>()!;
  }

  ApiProvider get apiProvider => _apiProvider;

  AppStorage get storage => _storage;

  String get cityId => _cityId;

  @override
  bool updateShouldNotify(AppDependencies oldWidget) => false;
}
