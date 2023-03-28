import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_summary.freezed.dart';
part 'recipe_summary.g.dart';

@freezed
class RecipeSummary with _$RecipeSummary {
  const factory RecipeSummary({
    required String id,
    required String name,
    required List<String> photos,
  }) = _RecipeSummary;

  factory RecipeSummary.fromJson(Map<String, dynamic> json) =>
      _$RecipeSummaryFromJson(json);
}
