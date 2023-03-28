// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MealListDto _$$_MealListDtoFromJson(Map<String, dynamic> json) =>
    _$_MealListDto(
      meals: (json['meals'] as List<dynamic>)
          .map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MealListDtoToJson(_$_MealListDto instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };
