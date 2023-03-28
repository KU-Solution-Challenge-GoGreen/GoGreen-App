import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gogreen_client/models/category_availability.dart';

part 'vegan_type.freezed.dart';
part 'vegan_type.g.dart';

@freezed
class VeganType with _$VeganType {
  const factory VeganType({
    required String id,
    required String name,
    required List<CategoryAvailability> categoryAvailabilityList,
  }) = _VeganType;

  factory VeganType.fromJson(Map<String, dynamic> json) =>
      _$VeganTypeFromJson(json);
}
