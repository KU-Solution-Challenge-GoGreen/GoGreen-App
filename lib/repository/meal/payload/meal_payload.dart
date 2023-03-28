import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_payload.freezed.dart';
part 'meal_payload.g.dart';

@freezed
class MealPayload with _$MealPayload {
  const factory MealPayload({
    required String recipeId,
    required String title,
    required String? memo,
    required String? photo,
    required String date,
  }) = _MealPayload;

  factory MealPayload.fromJson(Map<String, dynamic> json) =>
      _$MealPayloadFromJson(json);
}
