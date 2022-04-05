import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/persistance/hive_constants.dart';

part 'temp_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_TEMP_VO,adapterName: "TempVOAdapter")
class TempVO {

  @JsonKey(name: "day")
  @HiveField(0)
  double? day;

  @JsonKey(name: "min")
  @HiveField(1)
  double? min;

  @JsonKey(name: "max")
  @HiveField(2)
  double? max;

  @JsonKey(name: "night")
  @HiveField(3)
  double? night;

  @JsonKey(name: "eve")
  @HiveField(4)
  double? eve;

  @JsonKey(name: "morn")
  @HiveField(5)
  double? morn;

  TempVO({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });
  
factory TempVO.fromJson(Map<String,dynamic> json) => _$TempVOFromJson(json);

Map<String,dynamic> toJson() => _$TempVOToJson(this);


  @override
  String toString() {
    return 'TempVO(day: $day, min: $min, max: $max, night: $night, eve: $eve, morn: $morn)';
  }
}
