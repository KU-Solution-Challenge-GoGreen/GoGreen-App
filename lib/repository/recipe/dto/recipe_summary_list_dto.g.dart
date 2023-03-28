// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_summary_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeSummaryListDto _$$_RecipeSummaryListDtoFromJson(
        Map<String, dynamic> json) =>
    _$_RecipeSummaryListDto(
      recipes: (json['recipes'] as List<dynamic>)
          .map((e) => RecipeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecipeSummaryListDtoToJson(
        _$_RecipeSummaryListDto instance) =>
    <String, dynamic>{
      'recipes': instance.recipes,
    };
