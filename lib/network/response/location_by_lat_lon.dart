import 'package:json_annotation/json_annotation.dart';

import 'package:weather_app/data/vos/clouds_vo.dart';
import 'package:weather_app/data/vos/coord_vo.dart';
import 'package:weather_app/data/vos/main_vo.dart';
import 'package:weather_app/data/vos/sys_vo.dart';
import 'package:weather_app/data/vos/weather_vo.dart';
import 'package:weather_app/data/vos/wind_vo.dart';

part 'location_by_lat_lon.g.dart';

@JsonSerializable()
class LocationByLatLon {

  @JsonKey(name: "coord")
  CoordVO? coord;

  @JsonKey(name: "weather")
  List<WeatherVO>? weather;

  @JsonKey(name: "base")
  String? base;

  @JsonKey(name: "main")
  MainVO? main;

  @JsonKey(name: "visibility")
  double? visibility;

  @JsonKey(name: "wind")
  WindVO? wind;

  @JsonKey(name: "clouds")
  CloudsVO? clouds;

  @JsonKey(name: "dt")
  int? dt;

  @JsonKey(name: "sys")
  SysVO? sys;

  @JsonKey(name: "timezone")
  int? timezone;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "cod")
  double? cod;

  
  LocationByLatLon({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });


 factory LocationByLatLon.fromJson(Map<String,dynamic> json) => _$LocationByLatLonFromJson(json);

  Map<String,dynamic> toJson() => _$LocationByLatLonToJson(this);

  @override
  String toString() {
    return 'LocationByLatLon(coord: $coord, weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod)';
  }
}
