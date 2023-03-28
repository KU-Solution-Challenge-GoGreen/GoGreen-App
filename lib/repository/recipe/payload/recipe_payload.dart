import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gogreen_client/repository/recipe/payload/step_payload.dart';

part 'recipe_payload.freezed.dart';
part 'recipe_payload.g.dart';

@freezed
class RecipePayload with _$RecipePayload {
  const factory RecipePayload({
    required String name,
    required int duration,
    required List<String> ingredientIds,
    required List<StepPayload> steps,
  }) = _RecipePayload;

  factory RecipePayload.fromJson(Map<String, dynamic> json) =>
      _$RecipePayloadFromJson(json);
}
