// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MealPayload _$$_MealPayloadFromJson(Map<String, dynamic> json) =>
    _$_MealPayload(
      recipeId: json['recipeId'] as String,
      title: json['title'] as String,
      memo: json['memo'] as String?,
      photo: json['photo'] as String?,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_MealPayloadToJson(_$_MealPayload instance) =>
    <String, dynamic>{
      'recipeId': instance.recipeId,
      'title': instance.title,
      'memo': instance.memo,
      'photo': instance.photo,
      'date': instance.date,
    };
