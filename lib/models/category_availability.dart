import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_availability.freezed.dart';
part 'category_availability.g.dart';

@freezed
class CategoryAvailability with _$CategoryAvailability {
  const factory CategoryAvailability({
    required String id,
    required String name,
    required bool isAvailable,
  }) = _CategoryAvailability;

  factory CategoryAvailability.fromJson(Map<String, dynamic> json) =>
      _$CategoryAvailabilityFromJson(json);
}
