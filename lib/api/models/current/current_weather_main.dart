// "main": {

// "temp": 309.12,
// "feels_like": 307.3,
// "temp_min": 309.12,
// "temp_max": 309.12,

// "pressure": 1006,
// "humidity": 20

// },

import 'package:flutter/foundation.dart';

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMax,
    required this.tempMin,
    required this.humidity,
    required this.pressure,
  });

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

factory Main.fromJson (Map<String, dynamic> json) => Main(
  temp: json['temp'] as  double? ?? 0.0,
  feelsLike: json['feels_like'] as double? ?? 0.0,
  tempMin:  json['temp_min'] as double? ?? 0.0,
  tempMax:  json['temp_max'] as double? ?? 0.0,
  pressure: json['pressure'] as int? ?? 0,
  humidity: json['humidity'] as int? ?? 0,

);
  Map<String, dynamic> toJson() => {
    'temp': temp,
    'feels_like': feelsLike,
    'temp_min':tempMin,
    'temp_max':tempMax,
    'pressure':pressure,
    'humidity':humidity,
  };
}
