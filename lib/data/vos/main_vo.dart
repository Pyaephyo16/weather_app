import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/persistance/hive_constants.dart';

part 'main_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_MAIN_VO,adapterName: "MainVOAdapter")
class MainVO {

  @JsonKey(name: "temp")
  @HiveField(0)
  double? temp;

  @JsonKey(name: "feels_like")
  @HiveField(1)
  double? feels_like;

  @JsonKey(name: "temp_min")
  @HiveField(2)
  double? temp_min;

  @JsonKey(name: "temp_max")
  @HiveField(3)
  double? temp_max;

  @JsonKey(name: "pressure")
  @HiveField(4)
  double? pressure;

  @JsonKey(name: "humidity")
  @HiveField(5)
  double? humidity;
  
  @JsonKey(name: "sea_level")
  @HiveField(6)
  double? sea_level;

  @JsonKey(name: "grnd_level")
  @HiveField(7)
  double? grnd_level;

  MainVO({
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.humidity,
    this.sea_level,
    this.grnd_level,
  });

 factory MainVO.fromJson(Map<String,dynamic> json) => _$MainVOFromJson(json);

  Map<String,dynamic> toJson() => _$MainVOToJson(this);


  @override
  String toString() {
    return 'MainVO(temp: $temp, feels_like: $feels_like, temp_min: $temp_min, temp_max: $temp_max, pressure: $pressure, humidity: $humidity, sea_level: $sea_level, grnd_level: $grnd_level)';
  }
}
