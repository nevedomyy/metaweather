import 'package:flutter/material.dart';
import 'package:metaweather/core/navigation/pages.dart';
import 'package:metaweather/features/city/ui/city_page.dart';
import 'package:metaweather/features/forecast/ui/forecast_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Pages.city:
      return MaterialPageRoute(builder: (_) => const CityPage());
    case Pages.forecast:
    default:
      return MaterialPageRoute(
        builder: (_) =>
            ForecastPage(cityId: settings.arguments?.toString() ?? ''),
      );
  }
}
