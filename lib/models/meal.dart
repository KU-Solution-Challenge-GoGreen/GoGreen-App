import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gogreen_client/models/recipe_summary.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

@freezed
class Meal with _$Meal {
  const factory Meal({
    required String id,
    required String userId,
    required String title,
    required String? memo,
    required RecipeSummary recipe,
    required String? photo,
    required double carbonFootprint,
    required DateTime date,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
