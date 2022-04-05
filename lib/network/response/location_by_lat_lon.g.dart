// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_by_lat_lon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationByLatLon _$LocationByLatLonFromJson(Map<String, dynamic> json) =>
    LocationByLatLon(
      coord: json['coord'] == null
          ? null
          : CoordVO.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String?,
      main: json['main'] == null
          ? null
          : MainVO.fromJson(json['main'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num?)?.toDouble(),
      wind: json['wind'] == null
          ? null
          : WindVO.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: json['clouds'] == null
          ? null
          : CloudsVO.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: json['dt'] as int?,
      sys: json['sys'] == null
          ? null
          : SysVO.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      cod: (json['cod'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationByLatLonToJson(LocationByLatLon instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };
