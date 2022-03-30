import 'package:flutter/material.dart';
import 'package:metaweather/core/global/keys.dart';
import 'package:metaweather/core/navigation/generate_route.dart';
import 'package:metaweather/core/utils/utils.dart';
import 'package:metaweather/features/city/ui/city_page.dart';
import 'package:metaweather/features/forecast/ui/forecast_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cityId = context.dependencies.cityId;

    return MaterialApp(
      scaffoldMessengerKey: Keys.snackbarKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.black,
        accentColor: AppColor.black,
      ),
      onGenerateRoute: generateRoute,
      home: cityId.isEmpty ? const CityPage() : ForecastPage(cityId: cityId),
    );
  }
}
