// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TempVOAdapter extends TypeAdapter<TempVO> {
  @override
  final int typeId = 7;

  @override
  TempVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TempVO(
      day: fields[0] as double?,
      min: fields[1] as double?,
      max: fields[2] as double?,
      night: fields[3] as double?,
      eve: fields[4] as double?,
      morn: fields[5] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, TempVO obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.min)
      ..writeByte(2)
      ..write(obj.max)
      ..writeByte(3)
      ..write(obj.night)
      ..writeByte(4)
      ..write(obj.eve)
      ..writeByte(5)
      ..write(obj.morn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TempVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempVO _$TempVOFromJson(Map<String, dynamic> json) => TempVO(
      day: (json['day'] as num?)?.toDouble(),
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      night: (json['night'] as num?)?.toDouble(),
      eve: (json['eve'] as num?)?.toDouble(),
      morn: (json['morn'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TempVOToJson(TempVO instance) => <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
