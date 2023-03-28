import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/meal.dart';

part 'meal_list_dto.freezed.dart';
part 'meal_list_dto.g.dart';

@freezed
class MealListDto with _$MealListDto {
  const factory MealListDto({
    required List<Meal> meals,
  }) = _MealListDto;

  factory MealListDto.fromJson(Map<String, dynamic> json) =>
      _$MealListDtoFromJson(json);
}
