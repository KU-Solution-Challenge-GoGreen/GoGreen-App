// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_summary_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MealSummaryListDto _$$_MealSummaryListDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MealSummaryListDto(
      meals: (json['meals'] as List<dynamic>)
          .map((e) => MealSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MealSummaryListDtoToJson(
        _$_MealSummaryListDto instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };
