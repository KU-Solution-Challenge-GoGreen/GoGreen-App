// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientListDto _$$_IngredientListDtoFromJson(Map<String, dynamic> json) =>
    _$_IngredientListDto(
      ingredientList: (json['ingredientList'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_IngredientListDtoToJson(
        _$_IngredientListDto instance) =>
    <String, dynamic>{
      'ingredientList': instance.ingredientList,
    };
