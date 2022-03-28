import 'package:json_annotation/json_annotation.dart';

import 'consolidated_weather.dart';
import 'parent.dart';
import 'source.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  @JsonKey(name: 'consolidated_weather')
  final List<ConsolidatedWeather> consolidatedWeather;
  final String? time;
  @JsonKey(name: 'sun_rise')
  final String? sunRise;
  @JsonKey(name: 'sun_set')
  final String? sunSet;
  @JsonKey(name: 'timezone_name')
  final String? timezoneName;
  final Parent? parent;
  final List<Source>? sources;
  final String title;
  @JsonKey(name: 'location_type')
  final String? locationType;
  final int? woeid;
  @JsonKey(name: 'latt_long')
  final String? lattLong;
  final String? timezone;

  const Forecast({
    this.consolidatedWeather = const [],
    this.time,
    this.sunRise,
    this.sunSet,
    this.timezoneName,
    this.parent,
    this.sources,
    this.title = '',
    this.locationType,
    this.woeid,
    this.lattLong,
    this.timezone,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return _$ForecastFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
