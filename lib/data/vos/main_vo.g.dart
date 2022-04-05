// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainVOAdapter extends TypeAdapter<MainVO> {
  @override
  final int typeId = 3;

  @override
  MainVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainVO(
      temp: fields[0] as double?,
      feels_like: fields[1] as double?,
      temp_min: fields[2] as double?,
      temp_max: fields[3] as double?,
      pressure: fields[4] as double?,
      humidity: fields[5] as double?,
      sea_level: fields[6] as double?,
      grnd_level: fields[7] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, MainVO obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.temp)
      ..writeByte(1)
      ..write(obj.feels_like)
      ..writeByte(2)
      ..write(obj.temp_min)
      ..writeByte(3)
      ..write(obj.temp_max)
      ..writeByte(4)
      ..write(obj.pressure)
      ..writeByte(5)
      ..write(obj.humidity)
      ..writeByte(6)
      ..write(obj.sea_level)
      ..writeByte(7)
      ..write(obj.grnd_level);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainVO _$MainVOFromJson(Map<String, dynamic> json) => MainVO(
      temp: (json['temp'] as num?)?.toDouble(),
      feels_like: (json['feels_like'] as num?)?.toDouble(),
      temp_min: (json['temp_min'] as num?)?.toDouble(),
      temp_max: (json['temp_max'] as num?)?.toDouble(),
      pressure: (json['pressure'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      sea_level: (json['sea_level'] as num?)?.toDouble(),
      grnd_level: (json['grnd_level'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MainVOToJson(MainVO instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'sea_level': instance.sea_level,
      'grnd_level': instance.grnd_level,
    };
