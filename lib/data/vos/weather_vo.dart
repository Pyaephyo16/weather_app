import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/persistance/hive_constants.dart';

part 'weather_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_WEATHER_VO,adapterName: "WeatherVOAdapter")
class WeatherVO {

  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "main")
  @HiveField(1)
  String? main;

  @JsonKey(name: "description")
  @HiveField(2)
  String? description;

  @JsonKey(name: "icon")
  @HiveField(3)
  String? icon;


  WeatherVO({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  
  factory WeatherVO.fromJson(Map<String,dynamic> json) => _$WeatherVOFromJson(json);

  Map<String,dynamic> toJson() => _$WeatherVOToJson(this);


  @override
  String toString() {
    return 'WeatherVO(id: $id, main: $main, description: $description, icon: $icon)';
  }
}
