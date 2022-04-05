// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyVOAdapter extends TypeAdapter<DailyVO> {
  @override
  final int typeId = 6;

  @override
  DailyVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyVO(
      dt: fields[0] as int?,
      sunrise: fields[1] as double?,
      sunset: fields[2] as double?,
      moonrise: fields[3] as double?,
      moonset: fields[4] as double?,
      moonPhase: fields[5] as double?,
      temp: fields[6] as TempVO?,
      feelsLike: fields[7] as TempVO?,
      pressure: fields[8] as double?,
      humidity: fields[9] as double?,
      dewPoint: fields[10] as double?,
      windSpeed: fields[11] as double?,
      windDeg: fields[12] as double?,
      windGust: fields[13] as double?,
      weather: (fields[14] as List?)?.cast<WeatherVO>(),
      clouds: fields[15] as int?,
      pop: fields[16] as double?,
      uvi: fields[17] as double?,
      isSelected: fields[18] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, DailyVO obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.sunset)
      ..writeByte(3)
      ..write(obj.moonrise)
      ..writeByte(4)
      ..write(obj.moonset)
      ..writeByte(5)
      ..write(obj.moonPhase)
      ..writeByte(6)
      ..write(obj.temp)
      ..writeByte(7)
      ..write(obj.feelsLike)
      ..writeByte(8)
      ..write(obj.pressure)
      ..writeByte(9)
      ..write(obj.humidity)
      ..writeByte(10)
      ..write(obj.dewPoint)
      ..writeByte(11)
      ..write(obj.windSpeed)
      ..writeByte(12)
      ..write(obj.windDeg)
      ..writeByte(13)
      ..write(obj.windGust)
      ..writeByte(14)
      ..write(obj.weather)
      ..writeByte(15)
      ..write(obj.clouds)
      ..writeByte(16)
      ..write(obj.pop)
      ..writeByte(17)
      ..write(obj.uvi)
      ..writeByte(18)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyVO _$DailyVOFromJson(Map<String, dynamic> json) => DailyVO(
      dt: json['dt'] as int?,
      sunrise: (json['sunrise'] as num?)?.toDouble(),
      sunset: (json['sunset'] as num?)?.toDouble(),
      moonrise: (json['moonrise'] as num?)?.toDouble(),
      moonset: (json['moonset'] as num?)?.toDouble(),
      moonPhase: (json['moon_phase'] as num?)?.toDouble(),
      temp: json['temp'] == null
          ? null
          : TempVO.fromJson(json['temp'] as Map<String, dynamic>),
      feelsLike: json['feels_like'] == null
          ? null
          : TempVO.fromJson(json['feels_like'] as Map<String, dynamic>),
      pressure: (json['pressure'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      dewPoint: (json['dew_point'] as num?)?.toDouble(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      windDeg: (json['wind_deg'] as num?)?.toDouble(),
      windGust: (json['wind_gust'] as num?)?.toDouble(),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: json['clouds'] as int?,
      pop: (json['pop'] as num?)?.toDouble(),
      uvi: (json['uvi'] as num?)?.toDouble(),
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$DailyVOToJson(DailyVO instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moonPhase,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'uvi': instance.uvi,
      'isSelected': instance.isSelected,
    };
