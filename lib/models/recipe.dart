import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gogreen_client/models/category.dart';
import 'package:gogreen_client/models/ingredient.dart';
import 'package:gogreen_client/models/step_data.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String userId,
    required String name,
    required double carbonFootprint,
    required int duration, // 분 단위
    required List<Ingredient> ingredients,
    required List<Category> categories,
    required List<StepData> steps,
    required List<String> photos,
    required bool isBookmarked,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
