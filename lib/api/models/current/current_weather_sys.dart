// "sys": {

// "type": 1,
// "id": 9016,
// "country": "UZ",
// "sunrise": 1659918298,
// "sunset": 1659969164

// }

import 'package:json_annotation/json_annotation.dart';

part 'current_weather_sys.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrentWeatherSys {
  @JsonKey(defaultValue: 0, name: 'type')
  int type;

  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: '', name: 'country')
  String country;

  @JsonKey(defaultValue: 0, name: 'sunrise')
  int sunrise;

  @JsonKey(defaultValue: 0, name: 'sunset')
  int sunset;

  CurrentWeatherSys({
    required this.id,
    required this.type,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory CurrentWeatherSys.fromJson(Map<String, dynamic> json) => _$CurrentWeatherSysFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherSysToJson(this);
}
