// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPayload _$UserPayloadFromJson(Map<String, dynamic> json) {
  return _UserPayload.fromJson(json);
}

/// @nodoc
mixin _$UserPayload {
  String get name => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPayloadCopyWith<UserPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPayloadCopyWith<$Res> {
  factory $UserPayloadCopyWith(
          UserPayload value, $Res Function(UserPayload) then) =
      _$UserPayloadCopyWithImpl<$Res, UserPayload>;
  @useResult
  $Res call({String name, String? photo});
}

/// @nodoc
class _$UserPayloadCopyWithImpl<$Res, $Val extends UserPayload>
    implements $UserPayloadCopyWith<$Res> {
  _$UserPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserPayloadCopyWith<$Res>
    implements $UserPayloadCopyWith<$Res> {
  factory _$$_UserPayloadCopyWith(
          _$_UserPayload value, $Res Function(_$_UserPayload) then) =
      __$$_UserPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? photo});
}

/// @nodoc
class __$$_UserPayloadCopyWithImpl<$Res>
    extends _$UserPayloadCopyWithImpl<$Res, _$_UserPayload>
    implements _$$_UserPayloadCopyWith<$Res> {
  __$$_UserPayloadCopyWithImpl(
      _$_UserPayload _value, $Res Function(_$_UserPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? photo = freezed,
  }) {
    return _then(_$_UserPayload(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
class _$_UserPayload implements _UserPayload {
  const _$_UserPayload({required this.name, required this.photo});

  factory _$_UserPayload.fromJson(Map<String, dynamic> json) =>
      _$$_UserPayloadFromJson(json);

  @override
  final String name;
  @override
  final String? photo;

  @override
  String toString() {
    return 'UserPayload(name: $name, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPayload &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPayloadCopyWith<_$_UserPayload> get copyWith =>
      __$$_UserPayloadCopyWithImpl<_$_UserPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserPayloadToJson(
      this,
    );
  }
}

abstract class _UserPayload implements UserPayload {
  const factory _UserPayload(
      {required final String name,
      required final String? photo}) = _$_UserPayload;

  factory _UserPayload.fromJson(Map<String, dynamic> json) =
      _$_UserPayload.fromJson;

  @override
  String get name;
  @override
  String? get photo;
  @override
  @JsonKey(ignore: true)
  _$$_UserPayloadCopyWith<_$_UserPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
