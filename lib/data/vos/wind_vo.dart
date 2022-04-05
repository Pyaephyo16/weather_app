import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/persistance/hive_constants.dart';

part 'wind_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_WIND_VO,adapterName: "WindVOAdapter")
class WindVO {

  @JsonKey(name: "speed")
  @HiveField(0)
  double? speed;

  @JsonKey(name: "deg")
  @HiveField(1)
  double? deg;

  @JsonKey(name: "gust")
  @HiveField(2)
  double? gust;


  WindVO({
    this.speed,
    this.deg,
    this.gust,
  });

 factory WindVO.fromJson(Map<String,dynamic> json) => _$WindVOFromJson(json);

  Map<String,dynamic> toJson() => _$WindVOToJson(this);


  @override
  String toString() => 'WindVO(speed: $speed, deg: $deg, gust: $gust)';
}
