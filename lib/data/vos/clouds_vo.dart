import 'package:json_annotation/json_annotation.dart';

part 'clouds_vo.g.dart';

@JsonSerializable()
class CloudsVO {

  @JsonKey(name: "all")
  double? all;


  CloudsVO({
    this.all,
  });

   factory CloudsVO.fromJson(Map<String,dynamic> json) => _$CloudsVOFromJson(json);

  Map<String,dynamic> toJson() => _$CloudsVOToJson(this);


  @override
  String toString() => 'CloudsVO(all: $all)';
}
