import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:weather_app/data/daily_vos/daily_vo.dart';
import 'package:weather_app/persistance/hive_constants.dart';

part 'daily_list_for_hive_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_DAILY_LIST_FOR_HIVE_VO,adapterName: "DailyListForHiveVOAdapter")
class DailyListForHiveVO {

  @HiveField(0)
  List<DailyVO>? dailyList;

  DailyListForHiveVO({
    this.dailyList,
  });  

factory DailyListForHiveVO.fromJson(Map<String,dynamic> json) => _$DailyListForHiveVOFromJson(json);

Map<String,dynamic> toJson() => _$DailyListForHiveVOToJson(this);

  @override
  String toString() => 'DailyListForHiveVO(dailyList: $dailyList)';
}
