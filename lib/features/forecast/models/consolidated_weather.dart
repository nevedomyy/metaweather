import 'package:json_annotation/json_annotation.dart';

part 'consolidated_weather.g.dart';

@JsonSerializable()
class ConsolidatedWeather {
  final int? id;
  @JsonKey(name: 'weather_state_name')
  final String weatherStateName;
  @JsonKey(name: 'weather_state_abbr')
  final String weatherStateAbbr;
  @JsonKey(name: 'wind_direction_compass')
  final String? windDirectionCompass;
  final String? created;
  @JsonKey(name: 'applicable_date')
  final String? applicableDate;
  @JsonKey(name: 'min_temp')
  final double? minTemp;
  @JsonKey(name: 'max_temp')
  final double? maxTemp;
  @JsonKey(name: 'the_temp')
  final double? theTemp;
  @JsonKey(name: 'wind_speed')
  final double? windSpeed;
  @JsonKey(name: 'wind_direction')
  final double? windDirection;
  @JsonKey(name: 'air_pressure')
  final double? airPressure;
  final int? humidity;
  final double? visibility;
  final int? predictability;

  const ConsolidatedWeather({
    this.id,
    this.weatherStateName = '',
    this.weatherStateAbbr = '',
    this.windDirectionCompass,
    this.created,
    this.applicableDate,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.windSpeed,
    this.windDirection,
    this.airPressure,
    this.humidity,
    this.visibility,
    this.predictability,
  });

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) {
    return _$ConsolidatedWeatherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConsolidatedWeatherToJson(this);
}
