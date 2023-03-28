import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/ingredient.dart';

part 'ingredient_list_dto.freezed.dart';
part 'ingredient_list_dto.g.dart';

@freezed
class IngredientListDto with _$IngredientListDto {
  const factory IngredientListDto({
    required List<Ingredient> ingredientList,
  }) = _IngredientListDto;

  factory IngredientListDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientListDtoFromJson(json);
}
