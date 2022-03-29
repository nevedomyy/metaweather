import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:provider/provider.dart';

import 'package:metaweather/core/api/end_points.dart';
import 'package:metaweather/core/utils/assets.dart';
import 'package:metaweather/core/utils/textstyle.dart';
import 'package:metaweather/features/forecast/logic/forecast_notifier.dart';
import 'package:metaweather/features/forecast/ui/widgets/forecast_button.dart';

class ForecastPage extends StatefulWidget {
  final String cityId;

  const ForecastPage({Key? key, required this.cityId}) : super(key: key);

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _fetchForecast();
    });
  }

  void _fetchForecast() {
    context.read<ForecastNotifier>().fetchForecast(cityId: widget.cityId);
  }

  String _windSpeed(double? windSpeed) {
    return windSpeed != null ? '${windSpeed.toInt()} m/s' : 'NA';
  }

  String _humidity(int? humidity) {
    return humidity != null ? '$humidity %' : 'NA';
  }

  String _temp(double? theTemp) {
    return theTemp != null ? '${theTemp.toInt()}\u{00B0}' : '';
  }

  String _minMaxTemp(double? minTemp, double? maxTemp) {
    return minTemp != null && maxTemp != null
        ? '${minTemp.toInt()}\u{00B0} min | max ${maxTemp.toInt()}\u{00B0}'
        : '';
  }

  String _dateTime(String? created) {
    return created != null
        ? created.substring(0, 19).replaceFirst('T', ' ')
        : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ForecastNotifier>(
        builder: (context, state, child) {
          final forecast = state.forecast;
          if (forecast == null) return const SizedBox();
          final weather = forecast.consolidatedWeather;
          if (weather.isEmpty) return const SizedBox();
          final data = weather.first;

          return Column(
            children: [
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.wind,
                        width: 50,
                      ),
                      Text(
                        _windSpeed(data.windSpeed),
                        style: AppTextStyle.normalWhite18,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        AppAssets.humidity,
                        width: 50,
                      ),
                      Text(
                        _humidity(data.humidity),
                        style: AppTextStyle.normalWhite18,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                _temp(data.theTemp),
                style: AppTextStyle.normalWhite100,
              ),
              Text(
                _minMaxTemp(data.minTemp, data.maxTemp),
                style: AppTextStyle.normalWhite14,
              ),
              const SizedBox(height: 30),
              Text(
                forecast.title,
                style: AppTextStyle.boldWhite22,
              ),
              Text(
                data.weatherStateName,
                style: AppTextStyle.normalWhite18,
              ),
              Expanded(
                child: Center(
                  child: SvgPicture.network(
                    EndPoints.fetchImage(data.weatherStateAbbr),
                    width: 130,
                    height: 130,
                  ),
                ),
              ),
              Text(
                _dateTime(data.created),
                style: AppTextStyle.normalWhite14,
              ),
              const SizedBox(height: 8),
            ],
          );
        },
      ),
      floatingActionButton: ForecastButton(
        onTap: _fetchForecast,
      ),
    );
  }
}
