import 'package:json_annotation/json_annotation.dart';
import 'package:my_weather_app/api/models/one_call/daily_item/daily_item.dart';
import 'package:my_weather_app/api/models/one_call/hourly_item/hourly_item.dart';

part 'one_call_data.g.dart';

@JsonSerializable()
class OneCallData {
  @JsonKey(defaultValue: 0.0, name: 'lat')
  double lat;

  @JsonKey(defaultValue: 0.0, name: 'lon')
  double lon;

  @JsonKey(defaultValue: "", name: 'timezone')
  String timezone;

  @JsonKey(defaultValue: 0, name: 'timezone_offset')
  int timezoneOffset;

  @JsonKey(defaultValue: [], name: 'hourly')
  List<HourlyItem> hourly;

  @JsonKey(defaultValue: [], name: 'daily')
  List<DailyItem> daily;

  OneCallData({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.daily,
    required this.hourly,
    required this.timezoneOffset,
  });

  factory OneCallData.fromJson(Map<String, dynamic> json) =>
      _$OneCallDataFromJson(json);

  Map<String, dynamic> toJson() => _$OneCallDataToJson(this);
}