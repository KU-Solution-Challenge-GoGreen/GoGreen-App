// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDetail _$$_UserDetailFromJson(Map<String, dynamic> json) =>
    _$_UserDetail(
      id: json['id'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String?,
      mealCount: (json['mealCount'] as List<dynamic>)
          .map((e) => MealCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      avgFootprint: (json['avgFootprint'] as num).toDouble(),
      sinceSignUp: json['sinceSignUp'] as int,
    );

Map<String, dynamic> _$$_UserDetailToJson(_$_UserDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'mealCount': instance.mealCount,
      'avgFootprint': instance.avgFootprint,
      'sinceSignUp': instance.sinceSignUp,
    };
