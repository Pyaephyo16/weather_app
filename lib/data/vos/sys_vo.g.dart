// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SysVOAdapter extends TypeAdapter<SysVO> {
  @override
  final int typeId = 1;

  @override
  SysVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SysVO(
      country: fields[0] as String?,
      sunrise: fields[1] as int?,
      sunset: fields[2] as int?,
      weather: (fields[3] as List?)?.cast<WeatherVO>(),
      main: fields[4] as MainVO?,
      wind: fields[5] as WindVO?,
      coord: fields[6] as CoordVO?,
      name: fields[7] as String?,
      dt: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SysVO obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.sunset)
      ..writeByte(3)
      ..write(obj.weather)
      ..writeByte(4)
      ..write(obj.main)
      ..writeByte(5)
      ..write(obj.wind)
      ..writeByte(6)
      ..write(obj.coord)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.dt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SysVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SysVO _$SysVOFromJson(Map<String, dynamic> json) => SysVO(
      country: json['country'] as String?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: json['main'] == null
          ? null
          : MainVO.fromJson(json['main'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? null
          : WindVO.fromJson(json['wind'] as Map<String, dynamic>),
      coord: json['coord'] == null
          ? null
          : CoordVO.fromJson(json['coord'] as Map<String, dynamic>),
      name: json['name'] as String?,
      dt: json['dt'] as int?,
    );

Map<String, dynamic> _$SysVOToJson(SysVO instance) => <String, dynamic>{
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'weather': instance.weather,
      'main': instance.main,
      'wind': instance.wind,
      'coord': instance.coord,
      'name': instance.name,
      'dt': instance.dt,
    };
