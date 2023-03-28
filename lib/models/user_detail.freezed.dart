// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) {
  return _UserDetail.fromJson(json);
}

/// @nodoc
mixin _$UserDetail {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  List<MealCount> get mealCount => throw _privateConstructorUsedError;
  double get avgFootprint => throw _privateConstructorUsedError;
  int get sinceSignUp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDetailCopyWith<UserDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailCopyWith<$Res> {
  factory $UserDetailCopyWith(
          UserDetail value, $Res Function(UserDetail) then) =
      _$UserDetailCopyWithImpl<$Res, UserDetail>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? photo,
      List<MealCount> mealCount,
      double avgFootprint,
      int sinceSignUp});
}

/// @nodoc
class _$UserDetailCopyWithImpl<$Res, $Val extends UserDetail>
    implements $UserDetailCopyWith<$Res> {
  _$UserDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photo = freezed,
    Object? mealCount = null,
    Object? avgFootprint = null,
    Object? sinceSignUp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      mealCount: null == mealCount
          ? _value.mealCount
          : mealCount // ignore: cast_nullable_to_non_nullable
              as List<MealCount>,
      avgFootprint: null == avgFootprint
          ? _value.avgFootprint
          : avgFootprint // ignore: cast_nullable_to_non_nullable
              as double,
      sinceSignUp: null == sinceSignUp
          ? _value.sinceSignUp
          : sinceSignUp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDetailCopyWith<$Res>
    implements $UserDetailCopyWith<$Res> {
  factory _$$_UserDetailCopyWith(
          _$_UserDetail value, $Res Function(_$_UserDetail) then) =
      __$$_UserDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? photo,
      List<MealCount> mealCount,
      double avgFootprint,
      int sinceSignUp});
}

/// @nodoc
class __$$_UserDetailCopyWithImpl<$Res>
    extends _$UserDetailCopyWithImpl<$Res, _$_UserDetail>
    implements _$$_UserDetailCopyWith<$Res> {
  __$$_UserDetailCopyWithImpl(
      _$_UserDetail _value, $Res Function(_$_UserDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photo = freezed,
    Object? mealCount = null,
    Object? avgFootprint = null,
    Object? sinceSignUp = null,
  }) {
    return _then(_$_UserDetail(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      mealCount: null == mealCount
          ? _value._mealCount
          : mealCount // ignore: cast_nullable_to_non_nullable
              as List<MealCount>,
      avgFootprint: null == avgFootprint
          ? _value.avgFootprint
          : avgFootprint // ignore: cast_nullable_to_non_nullable
              as double,
      sinceSignUp: null == sinceSignUp
          ? _value.sinceSignUp
          : sinceSignUp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDetail implements _UserDetail {
  const _$_UserDetail(
      {required this.id,
      required this.name,
      required this.photo,
      required final List<MealCount> mealCount,
      required this.avgFootprint,
      required this.sinceSignUp})
      : _mealCount = mealCount;

  factory _$_UserDetail.fromJson(Map<String, dynamic> json) =>
      _$$_UserDetailFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? photo;
  final List<MealCount> _mealCount;
  @override
  List<MealCount> get mealCount {
    if (_mealCount is EqualUnmodifiableListView) return _mealCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mealCount);
  }

  @override
  final double avgFootprint;
  @override
  final int sinceSignUp;

  @override
  String toString() {
    return 'UserDetail(id: $id, name: $name, photo: $photo, mealCount: $mealCount, avgFootprint: $avgFootprint, sinceSignUp: $sinceSignUp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            const DeepCollectionEquality()
                .equals(other._mealCount, _mealCount) &&
            (identical(other.avgFootprint, avgFootprint) ||
                other.avgFootprint == avgFootprint) &&
            (identical(other.sinceSignUp, sinceSignUp) ||
                other.sinceSignUp == sinceSignUp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      photo,
      const DeepCollectionEquality().hash(_mealCount),
      avgFootprint,
      sinceSignUp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDetailCopyWith<_$_UserDetail> get copyWith =>
      __$$_UserDetailCopyWithImpl<_$_UserDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDetailToJson(
      this,
    );
  }
}

abstract class _UserDetail implements UserDetail {
  const factory _UserDetail(
      {required final String id,
      required final String name,
      required final String? photo,
      required final List<MealCount> mealCount,
      required final double avgFootprint,
      required final int sinceSignUp}) = _$_UserDetail;

  factory _UserDetail.fromJson(Map<String, dynamic> json) =
      _$_UserDetail.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get photo;
  @override
  List<MealCount> get mealCount;
  @override
  double get avgFootprint;
  @override
  int get sinceSignUp;
  @override
  @JsonKey(ignore: true)
  _$$_UserDetailCopyWith<_$_UserDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
