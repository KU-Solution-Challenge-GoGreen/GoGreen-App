// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StepPayload _$StepPayloadFromJson(Map<String, dynamic> json) {
  return _StepPayload.fromJson(json);
}

/// @nodoc
mixin _$StepPayload {
  String get description => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepPayloadCopyWith<StepPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepPayloadCopyWith<$Res> {
  factory $StepPayloadCopyWith(
          StepPayload value, $Res Function(StepPayload) then) =
      _$StepPayloadCopyWithImpl<$Res, StepPayload>;
  @useResult
  $Res call({String description, String? photo});
}

/// @nodoc
class _$StepPayloadCopyWithImpl<$Res, $Val extends StepPayload>
    implements $StepPayloadCopyWith<$Res> {
  _$StepPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StepPayloadCopyWith<$Res>
    implements $StepPayloadCopyWith<$Res> {
  factory _$$_StepPayloadCopyWith(
          _$_StepPayload value, $Res Function(_$_StepPayload) then) =
      __$$_StepPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String? photo});
}

/// @nodoc
class __$$_StepPayloadCopyWithImpl<$Res>
    extends _$StepPayloadCopyWithImpl<$Res, _$_StepPayload>
    implements _$$_StepPayloadCopyWith<$Res> {
  __$$_StepPayloadCopyWithImpl(
      _$_StepPayload _value, $Res Function(_$_StepPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? photo = freezed,
  }) {
    return _then(_$_StepPayload(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StepPayload implements _StepPayload {
  const _$_StepPayload({required this.description, required this.photo});

  factory _$_StepPayload.fromJson(Map<String, dynamic> json) =>
      _$$_StepPayloadFromJson(json);

  @override
  final String description;
  @override
  final String? photo;

  @override
  String toString() {
    return 'StepPayload(description: $description, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepPayload &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StepPayloadCopyWith<_$_StepPayload> get copyWith =>
      __$$_StepPayloadCopyWithImpl<_$_StepPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StepPayloadToJson(
      this,
    );
  }
}

abstract class _StepPayload implements StepPayload {
  const factory _StepPayload(
      {required final String description,
      required final String? photo}) = _$_StepPayload;

  factory _StepPayload.fromJson(Map<String, dynamic> json) =
      _$_StepPayload.fromJson;

  @override
  String get description;
  @override
  String? get photo;
  @override
  @JsonKey(ignore: true)
  _$$_StepPayloadCopyWith<_$_StepPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
