import 'package:json_annotation/json_annotation.dart';

import 'package:weather_app/data/daily_vos/daily_vo.dart';

part 'daily_forecast_response.g.dart';

@JsonSerializable()
class DailyForecastResponse {

  @JsonKey(name: "lat")
  double? lat;

  @JsonKey(name: "lon")
  double? lon;

  @JsonKey(name: "timezone")
  String? timezone;

  @JsonKey(name: "timezone_offset")
  int? timezoneOffset;

  @JsonKey(name: "daily")
  List<DailyVO>? daily;
  DailyForecastResponse({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.daily,
  });

factory DailyForecastResponse.fromJson(Map<String,dynamic> json) => _$DailyForecastResponseFromJson(json);

Map<String,dynamic> toJson() => _$DailyForecastResponseToJson(this);

  @override
  String toString() {
    return 'DailyForecastResponse(lat: $lat, lon: $lon, timezone: $timezone, timezoneOffset: $timezoneOffset, daily: $daily)';
  }
}
