// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_availability.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryAvailability _$CategoryAvailabilityFromJson(Map<String, dynamic> json) {
  return _CategoryAvailability.fromJson(json);
}

/// @nodoc
mixin _$CategoryAvailability {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryAvailabilityCopyWith<CategoryAvailability> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryAvailabilityCopyWith<$Res> {
  factory $CategoryAvailabilityCopyWith(CategoryAvailability value,
          $Res Function(CategoryAvailability) then) =
      _$CategoryAvailabilityCopyWithImpl<$Res, CategoryAvailability>;
  @useResult
  $Res call({String id, String name, bool isAvailable});
}

/// @nodoc
class _$CategoryAvailabilityCopyWithImpl<$Res,
        $Val extends CategoryAvailability>
    implements $CategoryAvailabilityCopyWith<$Res> {
  _$CategoryAvailabilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isAvailable = null,
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
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryAvailabilityCopyWith<$Res>
    implements $CategoryAvailabilityCopyWith<$Res> {
  factory _$$_CategoryAvailabilityCopyWith(_$_CategoryAvailability value,
          $Res Function(_$_CategoryAvailability) then) =
      __$$_CategoryAvailabilityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, bool isAvailable});
}

/// @nodoc
class __$$_CategoryAvailabilityCopyWithImpl<$Res>
    extends _$CategoryAvailabilityCopyWithImpl<$Res, _$_CategoryAvailability>
    implements _$$_CategoryAvailabilityCopyWith<$Res> {
  __$$_CategoryAvailabilityCopyWithImpl(_$_CategoryAvailability _value,
      $Res Function(_$_CategoryAvailability) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isAvailable = null,
  }) {
    return _then(_$_CategoryAvailability(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryAvailability implements _CategoryAvailability {
  const _$_CategoryAvailability(
      {required this.id, required this.name, required this.isAvailable});

  factory _$_CategoryAvailability.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryAvailabilityFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool isAvailable;

  @override
  String toString() {
    return 'CategoryAvailability(id: $id, name: $name, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryAvailability &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryAvailabilityCopyWith<_$_CategoryAvailability> get copyWith =>
      __$$_CategoryAvailabilityCopyWithImpl<_$_CategoryAvailability>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryAvailabilityToJson(
      this,
    );
  }
}

abstract class _CategoryAvailability implements CategoryAvailability {
  const factory _CategoryAvailability(
      {required final String id,
      required final String name,
      required final bool isAvailable}) = _$_CategoryAvailability;

  factory _CategoryAvailability.fromJson(Map<String, dynamic> json) =
      _$_CategoryAvailability.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get isAvailable;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryAvailabilityCopyWith<_$_CategoryAvailability> get copyWith =>
      throw _privateConstructorUsedError;
}
