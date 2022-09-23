// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_sys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherSys _$CurrentWeatherSysFromJson(Map<String, dynamic> json) =>
    CurrentWeatherSys(
      id: json['id'] as int? ?? 0,
      type: json['type'] as int? ?? 0,
      country: json['country'] as String? ?? '',
      sunrise: json['sunrise'] as int? ?? 0,
      sunset: json['sunset'] as int? ?? 0,
    );

Map<String, dynamic> _$CurrentWeatherSysToJson(CurrentWeatherSys instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
