// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskData _$TaskDataFromJson(Map<String, dynamic> json) => TaskData(
      capital: json['capital'] as String? ?? '',
      country_code: json['country_code'] as String? ?? '',
      country_name: json['country_name'] as String? ?? '',
      flag_image: json['flag_image'] as String? ?? '',
      population_count: json['population_count'] as String? ?? '',
      regioons_count: json['regioons_count'] as int? ?? 0,
    );

Map<String, dynamic> _$TaskDataToJson(TaskData instance) => <String, dynamic>{
      'country_name': instance.country_name,
      'country_code': instance.country_code,
      'capital': instance.capital,
      'regioons_count': instance.regioons_count,
      'population_count': instance.population_count,
      'flag_image': instance.flag_image,
    };
