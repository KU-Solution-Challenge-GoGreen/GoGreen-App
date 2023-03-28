// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MealPayload _$MealPayloadFromJson(Map<String, dynamic> json) {
  return _MealPayload.fromJson(json);
}

/// @nodoc
mixin _$MealPayload {
  String get recipeId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MealPayloadCopyWith<MealPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealPayloadCopyWith<$Res> {
  factory $MealPayloadCopyWith(
          MealPayload value, $Res Function(MealPayload) then) =
      _$MealPayloadCopyWithImpl<$Res, MealPayload>;
  @useResult
  $Res call(
      {String recipeId,
      String title,
      String? memo,
      String? photo,
      String date});
}

/// @nodoc
class _$MealPayloadCopyWithImpl<$Res, $Val extends MealPayload>
    implements $MealPayloadCopyWith<$Res> {
  _$MealPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = null,
    Object? title = null,
    Object? memo = freezed,
    Object? photo = freezed,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MealPayloadCopyWith<$Res>
    implements $MealPayloadCopyWith<$Res> {
  factory _$$_MealPayloadCopyWith(
          _$_MealPayload value, $Res Function(_$_MealPayload) then) =
      __$$_MealPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String recipeId,
      String title,
      String? memo,
      String? photo,
      String date});
}

/// @nodoc
class __$$_MealPayloadCopyWithImpl<$Res>
    extends _$MealPayloadCopyWithImpl<$Res, _$_MealPayload>
    implements _$$_MealPayloadCopyWith<$Res> {
  __$$_MealPayloadCopyWithImpl(
      _$_MealPayload _value, $Res Function(_$_MealPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = null,
    Object? title = null,
    Object? memo = freezed,
    Object? photo = freezed,
    Object? date = null,
  }) {
    return _then(_$_MealPayload(
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MealPayload implements _MealPayload {
  const _$_MealPayload(
      {required this.recipeId,
      required this.title,
      required this.memo,
      required this.photo,
      required this.date});

  factory _$_MealPayload.fromJson(Map<String, dynamic> json) =>
      _$$_MealPayloadFromJson(json);

  @override
  final String recipeId;
  @override
  final String title;
  @override
  final String? memo;
  @override
  final String? photo;
  @override
  final String date;

  @override
  String toString() {
    return 'MealPayload(recipeId: $recipeId, title: $title, memo: $memo, photo: $photo, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MealPayload &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, recipeId, title, memo, photo, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MealPayloadCopyWith<_$_MealPayload> get copyWith =>
      __$$_MealPayloadCopyWithImpl<_$_MealPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MealPayloadToJson(
      this,
    );
  }
}

abstract class _MealPayload implements MealPayload {
  const factory _MealPayload(
      {required final String recipeId,
      required final String title,
      required final String? memo,
      required final String? photo,
      required final String date}) = _$_MealPayload;

  factory _MealPayload.fromJson(Map<String, dynamic> json) =
      _$_MealPayload.fromJson;

  @override
  String get recipeId;
  @override
  String get title;
  @override
  String? get memo;
  @override
  String? get photo;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_MealPayloadCopyWith<_$_MealPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
