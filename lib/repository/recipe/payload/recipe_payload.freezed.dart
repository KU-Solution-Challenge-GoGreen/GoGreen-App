// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipePayload _$RecipePayloadFromJson(Map<String, dynamic> json) {
  return _RecipePayload.fromJson(json);
}

/// @nodoc
mixin _$RecipePayload {
  String get name => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  List<String> get ingredientIds => throw _privateConstructorUsedError;
  List<StepPayload> get steps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipePayloadCopyWith<RecipePayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipePayloadCopyWith<$Res> {
  factory $RecipePayloadCopyWith(
          RecipePayload value, $Res Function(RecipePayload) then) =
      _$RecipePayloadCopyWithImpl<$Res, RecipePayload>;
  @useResult
  $Res call(
      {String name,
      int duration,
      List<String> ingredientIds,
      List<StepPayload> steps});
}

/// @nodoc
class _$RecipePayloadCopyWithImpl<$Res, $Val extends RecipePayload>
    implements $RecipePayloadCopyWith<$Res> {
  _$RecipePayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? duration = null,
    Object? ingredientIds = null,
    Object? steps = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      ingredientIds: null == ingredientIds
          ? _value.ingredientIds
          : ingredientIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepPayload>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipePayloadCopyWith<$Res>
    implements $RecipePayloadCopyWith<$Res> {
  factory _$$_RecipePayloadCopyWith(
          _$_RecipePayload value, $Res Function(_$_RecipePayload) then) =
      __$$_RecipePayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int duration,
      List<String> ingredientIds,
      List<StepPayload> steps});
}

/// @nodoc
class __$$_RecipePayloadCopyWithImpl<$Res>
    extends _$RecipePayloadCopyWithImpl<$Res, _$_RecipePayload>
    implements _$$_RecipePayloadCopyWith<$Res> {
  __$$_RecipePayloadCopyWithImpl(
      _$_RecipePayload _value, $Res Function(_$_RecipePayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? duration = null,
    Object? ingredientIds = null,
    Object? steps = null,
  }) {
    return _then(_$_RecipePayload(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      ingredientIds: null == ingredientIds
          ? _value._ingredientIds
          : ingredientIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepPayload>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipePayload implements _RecipePayload {
  const _$_RecipePayload(
      {required this.name,
      required this.duration,
      required final List<String> ingredientIds,
      required final List<StepPayload> steps})
      : _ingredientIds = ingredientIds,
        _steps = steps;

  factory _$_RecipePayload.fromJson(Map<String, dynamic> json) =>
      _$$_RecipePayloadFromJson(json);

  @override
  final String name;
  @override
  final int duration;
  final List<String> _ingredientIds;
  @override
  List<String> get ingredientIds {
    if (_ingredientIds is EqualUnmodifiableListView) return _ingredientIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredientIds);
  }

  final List<StepPayload> _steps;
  @override
  List<StepPayload> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  String toString() {
    return 'RecipePayload(name: $name, duration: $duration, ingredientIds: $ingredientIds, steps: $steps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipePayload &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality()
                .equals(other._ingredientIds, _ingredientIds) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      duration,
      const DeepCollectionEquality().hash(_ingredientIds),
      const DeepCollectionEquality().hash(_steps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipePayloadCopyWith<_$_RecipePayload> get copyWith =>
      __$$_RecipePayloadCopyWithImpl<_$_RecipePayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipePayloadToJson(
      this,
    );
  }
}

abstract class _RecipePayload implements RecipePayload {
  const factory _RecipePayload(
      {required final String name,
      required final int duration,
      required final List<String> ingredientIds,
      required final List<StepPayload> steps}) = _$_RecipePayload;

  factory _RecipePayload.fromJson(Map<String, dynamic> json) =
      _$_RecipePayload.fromJson;

  @override
  String get name;
  @override
  int get duration;
  @override
  List<String> get ingredientIds;
  @override
  List<StepPayload> get steps;
  @override
  @JsonKey(ignore: true)
  _$$_RecipePayloadCopyWith<_$_RecipePayload> get copyWith =>
      throw _privateConstructorUsedError;
}
