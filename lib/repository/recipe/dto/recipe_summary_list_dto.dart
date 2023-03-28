import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/recipe_summary.dart';

part 'recipe_summary_list_dto.freezed.dart';
part 'recipe_summary_list_dto.g.dart';

@freezed
class RecipeSummaryListDto with _$RecipeSummaryListDto {
  const factory RecipeSummaryListDto({
    required List<RecipeSummary> recipes,
  }) = _RecipeSummaryListDto;

  factory RecipeSummaryListDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeSummaryListDtoFromJson(json);
}
