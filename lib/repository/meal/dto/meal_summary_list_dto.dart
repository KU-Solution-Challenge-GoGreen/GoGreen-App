import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/meal_summary.dart';

part 'meal_summary_list_dto.freezed.dart';
part 'meal_summary_list_dto.g.dart';

@freezed
class MealSummaryListDto with _$MealSummaryListDto {
  const factory MealSummaryListDto({
    required List<MealSummary> meals,
  }) = _MealSummaryListDto;

  factory MealSummaryListDto.fromJson(Map<String, dynamic> json) =>
      _$MealSummaryListDtoFromJson(json);
}
