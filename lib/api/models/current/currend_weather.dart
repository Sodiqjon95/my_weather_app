// {
// "coord": { },
// "weather": [{}],
// "base": "stations",
// "main": {},
// "visibility": 10000,
// "wind": { },
// "clouds": { },
// "dt": 1659955535,
// "sys": {},
// "timezone": 18000,
// "id": 1512569,
// "name": "Tashkent",
// "cod": 200
// }

import 'package:json_annotation/json_annotation.dart';
import 'package:my_weather_app/api/models/current/coord_data.dart';
import 'package:my_weather_app/api/models/current/current_weather_clouds.dart';
import 'package:my_weather_app/api/models/current/current_weather_main.dart';
import 'package:my_weather_app/api/models/current/current_weather_sys.dart';
import 'package:my_weather_app/api/models/current/current_weather_wind.dart';
import 'package:my_weather_app/api/models/current/weather_item_data.dart';

part 'currend_weather.g.dart';


@JsonSerializable()
class CurrentWeather {
  @JsonKey(name: 'coord')
  Coord coord;

  @JsonKey(defaultValue: [], name: 'weather')
  List<Weather> weather;

  @JsonKey(defaultValue: '', name: 'base')
  String base;

  @JsonKey(name: 'main')
  Main main;

  @JsonKey(defaultValue: 0, name: 'visibility')
  int visibility;

  @JsonKey(name: 'wind')
  CurrentWeatherWind wind;

  @JsonKey(defaultValue: 0, name: 'dt')
  int dt;

  @JsonKey(name: 'sys')
  CurrentWeatherSys sys;

  @JsonKey(defaultValue: 0, name: 'timezone')
  int timezone;

  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: '', name: 'name')
  String name;

  @JsonKey(defaultValue: 0, name: 'cod')
  int cod;

  CurrentWeather({
    required this.id,
    required this.main,
    required this.name,
    required this.visibility,
    required this.base,
    required this.cod,
    required this.coord,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.weather,
    required this.wind,

  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}