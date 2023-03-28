import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gogreen_client/models/meal_count.dart';

part 'user_detail.freezed.dart';
part 'user_detail.g.dart';

@freezed
class UserDetail with _$UserDetail {
  const factory UserDetail(
      {required String id,
      required String name,
      required String? photo,
      required List<MealCount> mealCount,
      required double avgFootprint,
      required int sinceSignUp}) = _UserDetail;

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);
}
