// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      consolidatedWeather: (json['consolidated_weather'] as List<dynamic>?)
              ?.map((e) =>
                  ConsolidatedWeather.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      time: json['time'] as String?,
      sunRise: json['sun_rise'] as String?,
      sunSet: json['sun_set'] as String?,
      timezoneName: json['timezone_name'] as String?,
      parent: json['parent'] == null
          ? null
          : Parent.fromJson(json['parent'] as Map<String, dynamic>),
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String? ?? '',
      locationType: json['location_type'] as String?,
      woeid: json['woeid'] as int?,
      lattLong: json['latt_long'] as String?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'consolidated_weather': instance.consolidatedWeather,
      'time': instance.time,
      'sun_rise': instance.sunRise,
      'sun_set': instance.sunSet,
      'timezone_name': instance.timezoneName,
      'parent': instance.parent,
      'sources': instance.sources,
      'title': instance.title,
      'location_type': instance.locationType,
      'woeid': instance.woeid,
      'latt_long': instance.lattLong,
      'timezone': instance.timezone,
    };
