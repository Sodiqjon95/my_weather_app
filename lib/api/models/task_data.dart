import 'package:json_annotation/json_annotation.dart';

part 'task_data.g.dart';
// {
// "country_name": "Uzbekistan",
// "country_code": "UZ",
// "capital": "Tashkent",
// "regioons_count": 12,
// "population_count": "37 million",
// "flag_image": "http://tfi.uz/photos/1/photos/flag-1024x512.jpg"
// }

@JsonSerializable(explicitToJson: true)
class TaskData {
  @JsonKey(defaultValue: '', name: 'country_name')
  String country_name;

  @JsonKey(defaultValue: '', name: 'country_code')
  String country_code;

  @JsonKey(defaultValue: '', name: 'capital')
  String capital;

  @JsonKey(defaultValue: 0, name: 'regioons_count')
  int regioons_count;

  @JsonKey(defaultValue: '', name: 'population_count')
  String population_count;

  @JsonKey(defaultValue: '', name: 'flag_image')
  String flag_image;

  TaskData({
    required this.capital,
    required this.country_code,
    required this.country_name,
    required this.flag_image,
    required this.population_count,
    required this.regioons_count,

  });

  factory TaskData.fromJson(Map<String, dynamic> json) =>
      _$TaskDataFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDataToJson(this);
}