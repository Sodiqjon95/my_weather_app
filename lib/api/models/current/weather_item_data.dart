import 'package:json_annotation/json_annotation.dart';

part'weather_item_data.g.dart';

@JsonSerializable(explicitToJson: true)
class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,

  });
  @JsonKey(defaultValue:0, name: "id")
  int id;

  @JsonKey(defaultValue:"", name: "main")
  String main;

  @JsonKey(defaultValue:"", name: "description")
  String description;

  @JsonKey(defaultValue:"", name: "icon")
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);


  Map<String, dynamic> toJson()=> _$WeatherToJson(this);
}
