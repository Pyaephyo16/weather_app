import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:weather_app/data/vos/coord_vo.dart';
import 'package:weather_app/data/vos/main_vo.dart';
import 'package:weather_app/data/vos/weather_vo.dart';
import 'package:weather_app/data/vos/wind_vo.dart';
import 'package:weather_app/persistance/hive_constants.dart';

part 'sys_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_SYS_VO,adapterName: "SysVOAdapter")
class SysVO {

  @JsonKey(name: "country")
  @HiveField(0)
  String? country;

  @JsonKey(name: "sunrise")
  @HiveField(1)
  int? sunrise;

  @JsonKey(name: "sunset")
  @HiveField(2)
  int? sunset;

  @HiveField(3)
  List<WeatherVO>? weather;

  @HiveField(4)
  MainVO? main;

  @HiveField(5)
  WindVO? wind;

  @HiveField(6)
  CoordVO? coord;

  @HiveField(7)
  String? name;

  @HiveField(8)
  int? dt;

  SysVO.emptySituation();

  SysVO({
    this.country,
    this.sunrise,
    this.sunset,
    this.weather,
    this.main,
    this.wind,
    this.coord,
    this.name,
    this.dt,
  });



 factory SysVO.fromJson(Map<String,dynamic> json) => _$SysVOFromJson(json);

  Map<String,dynamic> toJson() => _$SysVOToJson(this);

  @override
  String toString() => 'SysVO(country: $country, sunrise: $sunrise, sunset: $sunset)';
}
