// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meal _$$_MealFromJson(Map<String, dynamic> json) => _$_Meal(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      memo: json['memo'] as String?,
      recipe: RecipeSummary.fromJson(json['recipe'] as Map<String, dynamic>),
      photo: json['photo'] as String?,
      carbonFootprint: (json['carbonFootprint'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_MealToJson(_$_Meal instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'memo': instance.memo,
      'recipe': instance.recipe,
      'photo': instance.photo,
      'carbonFootprint': instance.carbonFootprint,
      'date': instance.date.toIso8601String(),
    };
