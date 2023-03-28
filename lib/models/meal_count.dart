import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_count.freezed.dart';
part 'meal_count.g.dart';

@freezed
class MealCount with _$MealCount {
  const factory MealCount({
    required DateTime date,
    required int count,
  }) = _MealCount;

  factory MealCount.fromJson(Map<String, dynamic> json) =>
      _$MealCountFromJson(json);
}
