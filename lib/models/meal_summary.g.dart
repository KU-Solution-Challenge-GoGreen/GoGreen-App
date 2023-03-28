// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MealSummary _$$_MealSummaryFromJson(Map<String, dynamic> json) =>
    _$_MealSummary(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      title: json['title'] as String,
      memo: json['memo'] as String?,
      photo: json['photo'] as String?,
      categoryIds: (json['categoryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      recipeName: json['recipeName'] as String,
      carbonFootprint: (json['carbonFootprint'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_MealSummaryToJson(_$_MealSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'title': instance.title,
      'memo': instance.memo,
      'photo': instance.photo,
      'categoryIds': instance.categoryIds,
      'recipeName': instance.recipeName,
      'carbonFootprint': instance.carbonFootprint,
      'date': instance.date.toIso8601String(),
    };
