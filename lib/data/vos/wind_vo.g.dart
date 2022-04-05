// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WindVOAdapter extends TypeAdapter<WindVO> {
  @override
  final int typeId = 4;

  @override
  WindVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WindVO(
      speed: fields[0] as double?,
      deg: fields[1] as double?,
      gust: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, WindVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.speed)
      ..writeByte(1)
      ..write(obj.deg)
      ..writeByte(2)
      ..write(obj.gust);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WindVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindVO _$WindVOFromJson(Map<String, dynamic> json) => WindVO(
      speed: (json['speed'] as num?)?.toDouble(),
      deg: (json['deg'] as num?)?.toDouble(),
      gust: (json['gust'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WindVOToJson(WindVO instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };
