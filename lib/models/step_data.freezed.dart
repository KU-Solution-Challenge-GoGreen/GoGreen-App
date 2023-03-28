// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StepData _$StepDataFromJson(Map<String, dynamic> json) {
  return _StepData.fromJson(json);
}

/// @nodoc
mixin _$StepData {
  String get id => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepDataCopyWith<StepData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepDataCopyWith<$Res> {
  factory $StepDataCopyWith(StepData value, $Res Function(StepData) then) =
      _$StepDataCopyWithImpl<$Res, StepData>;
  @useResult
  $Res call({String id, int index, String description, String? photo});
}

/// @nodoc
class _$StepDataCopyWithImpl<$Res, $Val extends StepData>
    implements $StepDataCopyWith<$Res> {
  _$StepDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? description = null,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_StepDataCopyWith<$Res> implements $StepDataCopyWith<$Res> {
  factory _$$_StepDataCopyWith(
          _$_StepData value, $Res Function(_$_StepData) then) =
      __$$_StepDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int index, String description, String? photo});
}

/// @nodoc
class __$$_StepDataCopyWithImpl<$Res>
    extends _$StepDataCopyWithImpl<$Res, _$_StepData>
    implements _$$_StepDataCopyWith<$Res> {
  __$$_StepDataCopyWithImpl(
      _$_StepData _value, $Res Function(_$_StepData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? description = null,
    Object? photo = freezed,
  }) {
    return _then(_$_StepData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_StepData implements _StepData {
  const _$_StepData(
      {required this.id,
      required this.index,
      required this.description,
      required this.photo});

  factory _$_StepData.fromJson(Map<String, dynamic> json) =>
      _$$_StepDataFromJson(json);

  @override
  final String id;
  @override
  final int index;
  @override
  final String description;
  @override
  final String? photo;

  @override
  String toString() {
    return 'StepData(id: $id, index: $index, description: $description, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, index, description, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StepDataCopyWith<_$_StepData> get copyWith =>
      __$$_StepDataCopyWithImpl<_$_StepData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StepDataToJson(
      this,
    );
  }
}

abstract class _StepData implements StepData {
  const factory _StepData(
      {required final String id,
      required final int index,
      required final String description,
      required final String? photo}) = _$_StepData;

  factory _StepData.fromJson(Map<String, dynamic> json) = _$_StepData.fromJson;

  @override
  String get id;
  @override
  int get index;
  @override
  String get description;
  @override
  String? get photo;
  @override
  @JsonKey(ignore: true)
  _$$_StepDataCopyWith<_$_StepData> get copyWith =>
      throw _privateConstructorUsedError;
}
