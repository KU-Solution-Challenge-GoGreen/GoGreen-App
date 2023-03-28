import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_data.freezed.dart';
part 'step_data.g.dart';

@freezed
class StepData with _$StepData {
  const factory StepData({
    required String id,
    required int index,
    required String description,
    required String? photo,
  }) = _StepData;

  factory StepData.fromJson(Map<String, dynamic> json) =>
      _$StepDataFromJson(json);
}
