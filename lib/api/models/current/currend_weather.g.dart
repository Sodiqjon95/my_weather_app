// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currend_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      id: json['id'] as int? ?? 0,
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
      name: json['name'] as String? ?? '',
      visibility: json['visibility'] as int? ?? 0,
      base: json['base'] as String? ?? '',
      cod: json['cod'] as int? ?? 0,
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
      dt: json['dt'] as int? ?? 0,
      sys: CurrentWeatherSys.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as int? ?? 0,
      weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      wind: CurrentWeatherWind.fromJson(json['wind'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };
