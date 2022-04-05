// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecastResponse _$DailyForecastResponseFromJson(
        Map<String, dynamic> json) =>
    DailyForecastResponse(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      timezoneOffset: json['timezone_offset'] as int?,
      daily: (json['daily'] as List<dynamic>?)
          ?.map((e) => DailyVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyForecastResponseToJson(
        DailyForecastResponse instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'daily': instance.daily,
    };
