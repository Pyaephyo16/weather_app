import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:weather_app/data/daily_vos/temp_vo.dart';
import 'package:weather_app/data/vos/weather_vo.dart';
import 'package:weather_app/persistance/hive_constants.dart';

part 'daily_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_DAILY_VO,adapterName: "DailyVOAdapter")
class DailyVO {

 @JsonKey(name: "dt")
 @HiveField(0)
   int? dt;

  @JsonKey(name: "sunrise")
  @HiveField(1)
  double? sunrise;

  @JsonKey(name: "sunset")
  @HiveField(2)
  double? sunset;

  @JsonKey(name: "moonrise")
  @HiveField(3)
  double? moonrise;

  @JsonKey(name: "moonset")
  @HiveField(4)
  double? moonset;

  @JsonKey(name: "moon_phase")
  @HiveField(5)
  double? moonPhase;

  @JsonKey(name: "temp")
  @HiveField(6)
  TempVO? temp;

  @JsonKey(name: "feels_like")
  @HiveField(7)
  TempVO? feelsLike;

  @JsonKey(name: "pressure")
  @HiveField(8)
  double? pressure;

  @JsonKey(name: "humidity")
  @HiveField(9)
  double? humidity;

  @JsonKey(name: "dew_point")
  @HiveField(10)
  double? dewPoint;

  @JsonKey(name: "wind_speed")
  @HiveField(11)
  double? windSpeed;
  
  @JsonKey(name: "wind_deg")
  @HiveField(12)
  double? windDeg;

  @JsonKey(name: "wind_gust")
  @HiveField(13)
  double? windGust;

  @JsonKey(name: "weather")
  @HiveField(14)
  List<WeatherVO>? weather;

 @JsonKey(name: "clouds")
 @HiveField(15)
  int? clouds;

 @JsonKey(name: "pop")
 @HiveField(16)
  double? pop;

 @JsonKey(name: "uvi") 
 @HiveField(17)
  double? uvi;

  @HiveField(18)
  bool? isSelected;

  DailyVO.emptySituation();

  DailyVO({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,
    this.isSelected,
  });

factory DailyVO.fromJson(Map<String,dynamic> json) => _$DailyVOFromJson(json);

Map<String,dynamic> toJson() => _$DailyVOToJson(this);




  @override
  String toString() {
    return 'DailyVO(dt: $dt, sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset, moonPhase: $moonPhase, temp: $temp, feelsLike: $feelsLike, pressure: $pressure, humidity: $humidity, dewPoint: $dewPoint, windSpeed: $windSpeed, windDeg: $windDeg, windGust: $windGust, weather: $weather, clouds: $clouds, pop: $pop, uvi: $uvi, isSelected: $isSelected)';
  }
}
