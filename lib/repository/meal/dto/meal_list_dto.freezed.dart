// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MealListDto _$MealListDtoFromJson(Map<String, dynamic> json) {
  return _MealListDto.fromJson(json);
}

/// @nodoc
mixin _$MealListDto {
  List<Meal> get meals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MealListDtoCopyWith<MealListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealListDtoCopyWith<$Res> {
  factory $MealListDtoCopyWith(
          MealListDto value, $Res Function(MealListDto) then) =
      _$MealListDtoCopyWithImpl<$Res, MealListDto>;
  @useResult
  $Res call({List<Meal> meals});
}

/// @nodoc
class _$MealListDtoCopyWithImpl<$Res, $Val extends MealListDto>
    implements $MealListDtoCopyWith<$Res> {
  _$MealListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meals = null,
  }) {
    return _then(_value.copyWith(
      meals: null == meals
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MealListDtoCopyWith<$Res>
    implements $MealListDtoCopyWith<$Res> {
  factory _$$_MealListDtoCopyWith(
          _$_MealListDto value, $Res Function(_$_MealListDto) then) =
      __$$_MealListDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Meal> meals});
}

/// @nodoc
class __$$_MealListDtoCopyWithImpl<$Res>
    extends _$MealListDtoCopyWithImpl<$Res, _$_MealListDto>
    implements _$$_MealListDtoCopyWith<$Res> {
  __$$_MealListDtoCopyWithImpl(
      _$_MealListDto _value, $Res Function(_$_MealListDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meals = null,
  }) {
    return _then(_$_MealListDto(
      meals: null == meals
          ? _value._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MealListDto implements _MealListDto {
  const _$_MealListDto({required final List<Meal> meals}) : _meals = meals;

  factory _$_MealListDto.fromJson(Map<String, dynamic> json) =>
      _$$_MealListDtoFromJson(json);

  final List<Meal> _meals;
  @override
  List<Meal> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  @override
  String toString() {
    return 'MealListDto(meals: $meals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MealListDto &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_meals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MealListDtoCopyWith<_$_MealListDto> get copyWith =>
      __$$_MealListDtoCopyWithImpl<_$_MealListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MealListDtoToJson(
      this,
    );
  }
}

abstract class _MealListDto implements MealListDto {
  const factory _MealListDto({required final List<Meal> meals}) =
      _$_MealListDto;

  factory _MealListDto.fromJson(Map<String, dynamic> json) =
      _$_MealListDto.fromJson;

  @override
  List<Meal> get meals;
  @override
  @JsonKey(ignore: true)
  _$$_MealListDtoCopyWith<_$_MealListDto> get copyWith =>
      throw _privateConstructorUsedError;
}
