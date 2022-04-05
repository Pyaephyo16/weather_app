// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coord_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoordVOAdapter extends TypeAdapter<CoordVO> {
  @override
  final int typeId = 5;

  @override
  CoordVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoordVO(
      lon: fields[0] as double?,
      lat: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, CoordVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lon)
      ..writeByte(1)
      ..write(obj.lat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoordVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordVO _$CoordVOFromJson(Map<String, dynamic> json) => CoordVO(
      lon: (json['lon'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordVOToJson(CoordVO instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
