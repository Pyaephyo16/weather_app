// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_list_for_hive_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyListForHiveVOAdapter extends TypeAdapter<DailyListForHiveVO> {
  @override
  final int typeId = 8;

  @override
  DailyListForHiveVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyListForHiveVO(
      dailyList: (fields[0] as List?)?.cast<DailyVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, DailyListForHiveVO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.dailyList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyListForHiveVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyListForHiveVO _$DailyListForHiveVOFromJson(Map<String, dynamic> json) =>
    DailyListForHiveVO(
      dailyList: (json['dailyList'] as List<dynamic>?)
          ?.map((e) => DailyVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyListForHiveVOToJson(DailyListForHiveVO instance) =>
    <String, dynamic>{
      'dailyList': instance.dailyList,
    };
