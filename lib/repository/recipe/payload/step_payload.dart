import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_payload.freezed.dart';
part 'step_payload.g.dart';

@freezed
class StepPayload with _$StepPayload {
  const factory StepPayload({
    required String description,
    required String? photo,
  }) = _StepPayload;

  factory StepPayload.fromJson(Map<String, dynamic> json) =>
      _$StepPayloadFromJson(json);
}
