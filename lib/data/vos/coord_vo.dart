import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/persistance/hive_constants.dart';

part 'coord_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_COORD_VO,adapterName: "CoordVOAdapter")
class CoordVO {

  @HiveField(0)
  @JsonKey(name: "lon")
  double? lon;

  @HiveField(1)
  @JsonKey(name: "lat")
  double? lat;

  CoordVO({
    this.lon,
    this.lat,
  });

  factory CoordVO.fromJson(Map<String,dynamic> json) => _$CoordVOFromJson(json);

  Map<String,dynamic> toJson() => _$CoordVOToJson(this);


  @override
  String toString() => 'CoordVO(lon: $lon, lat: $lat)';
}
