// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vegan_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VeganType _$VeganTypeFromJson(Map<String, dynamic> json) {
  return _VeganType.fromJson(json);
}

/// @nodoc
mixin _$VeganType {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<CategoryAvailability> get categoryAvailabilityList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VeganTypeCopyWith<VeganType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VeganTypeCopyWith<$Res> {
  factory $VeganTypeCopyWith(VeganType value, $Res Function(VeganType) then) =
      _$VeganTypeCopyWithImpl<$Res, VeganType>;
  @useResult
  $Res call(
      {String id,
      String name,
      List<CategoryAvailability> categoryAvailabilityList});
}

/// @nodoc
class _$VeganTypeCopyWithImpl<$Res, $Val extends VeganType>
    implements $VeganTypeCopyWith<$Res> {
  _$VeganTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryAvailabilityList = null,
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
      categoryAvailabilityList: null == categoryAvailabilityList
          ? _value.categoryAvailabilityList
          : categoryAvailabilityList // ignore: cast_nullable_to_non_nullable
              as List<CategoryAvailability>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VeganTypeCopyWith<$Res> implements $VeganTypeCopyWith<$Res> {
  factory _$$_VeganTypeCopyWith(
          _$_VeganType value, $Res Function(_$_VeganType) then) =
      __$$_VeganTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<CategoryAvailability> categoryAvailabilityList});
}

/// @nodoc
class __$$_VeganTypeCopyWithImpl<$Res>
    extends _$VeganTypeCopyWithImpl<$Res, _$_VeganType>
    implements _$$_VeganTypeCopyWith<$Res> {
  __$$_VeganTypeCopyWithImpl(
      _$_VeganType _value, $Res Function(_$_VeganType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryAvailabilityList = null,
  }) {
    return _then(_$_VeganType(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryAvailabilityList: null == categoryAvailabilityList
          ? _value._categoryAvailabilityList
          : categoryAvailabilityList // ignore: cast_nullable_to_non_nullable
              as List<CategoryAvailability>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VeganType implements _VeganType {
  const _$_VeganType(
      {required this.id,
      required this.name,
      required final List<CategoryAvailability> categoryAvailabilityList})
      : _categoryAvailabilityList = categoryAvailabilityList;

  factory _$_VeganType.fromJson(Map<String, dynamic> json) =>
      _$$_VeganTypeFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<CategoryAvailability> _categoryAvailabilityList;
  @override
  List<CategoryAvailability> get categoryAvailabilityList {
    if (_categoryAvailabilityList is EqualUnmodifiableListView)
      return _categoryAvailabilityList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryAvailabilityList);
  }

  @override
  String toString() {
    return 'VeganType(id: $id, name: $name, categoryAvailabilityList: $categoryAvailabilityList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VeganType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(
                other._categoryAvailabilityList, _categoryAvailabilityList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_categoryAvailabilityList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VeganTypeCopyWith<_$_VeganType> get copyWith =>
      __$$_VeganTypeCopyWithImpl<_$_VeganType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VeganTypeToJson(
      this,
    );
  }
}

abstract class _VeganType implements VeganType {
  const factory _VeganType(
          {required final String id,
          required final String name,
          required final List<CategoryAvailability> categoryAvailabilityList}) =
      _$_VeganType;

  factory _VeganType.fromJson(Map<String, dynamic> json) =
      _$_VeganType.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<CategoryAvailability> get categoryAvailabilityList;
  @override
  @JsonKey(ignore: true)
  _$$_VeganTypeCopyWith<_$_VeganType> get copyWith =>
      throw _privateConstructorUsedError;
}
