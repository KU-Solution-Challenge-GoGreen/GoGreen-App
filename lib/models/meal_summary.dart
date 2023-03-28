import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_summary.freezed.dart';
part 'meal_summary.g.dart';

@freezed
class MealSummary with _$MealSummary {
  const factory MealSummary({
    required String id,
    required String userId,
    required String userName,
    required String title,
    required String? memo,
    required String? photo,
    required List<String> categoryIds,
    required String recipeName,
    required double carbonFootprint,
    required DateTime date,
  }) = _MealSummary;

  factory MealSummary.fromJson(Map<String, dynamic> json) =>
      _$MealSummaryFromJson(json);
}
