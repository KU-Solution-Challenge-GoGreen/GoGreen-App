// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MealCount _$$_MealCountFromJson(Map<String, dynamic> json) => _$_MealCount(
      date: DateTime.parse(json['date'] as String),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_MealCountToJson(_$_MealCount instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'count': instance.count,
    };
