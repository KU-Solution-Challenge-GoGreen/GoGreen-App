// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_summary_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MealSummaryListDto _$MealSummaryListDtoFromJson(Map<String, dynamic> json) {
  return _MealSummaryListDto.fromJson(json);
}

/// @nodoc
mixin _$MealSummaryListDto {
  List<MealSummary> get meals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MealSummaryListDtoCopyWith<MealSummaryListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealSummaryListDtoCopyWith<$Res> {
  factory $MealSummaryListDtoCopyWith(
          MealSummaryListDto value, $Res Function(MealSummaryListDto) then) =
      _$MealSummaryListDtoCopyWithImpl<$Res, MealSummaryListDto>;
  @useResult
  $Res call({List<MealSummary> meals});
}

/// @nodoc
class _$MealSummaryListDtoCopyWithImpl<$Res, $Val extends MealSummaryListDto>
    implements $MealSummaryListDtoCopyWith<$Res> {
  _$MealSummaryListDtoCopyWithImpl(this._value, this._then);

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
              as List<MealSummary>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MealSummaryListDtoCopyWith<$Res>
    implements $MealSummaryListDtoCopyWith<$Res> {
  factory _$$_MealSummaryListDtoCopyWith(_$_MealSummaryListDto value,
          $Res Function(_$_MealSummaryListDto) then) =
      __$$_MealSummaryListDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MealSummary> meals});
}

/// @nodoc
class __$$_MealSummaryListDtoCopyWithImpl<$Res>
    extends _$MealSummaryListDtoCopyWithImpl<$Res, _$_MealSummaryListDto>
    implements _$$_MealSummaryListDtoCopyWith<$Res> {
  __$$_MealSummaryListDtoCopyWithImpl(
      _$_MealSummaryListDto _value, $Res Function(_$_MealSummaryListDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meals = null,
  }) {
    return _then(_$_MealSummaryListDto(
      meals: null == meals
          ? _value._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<MealSummary>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MealSummaryListDto implements _MealSummaryListDto {
  const _$_MealSummaryListDto({required final List<MealSummary> meals})
      : _meals = meals;

  factory _$_MealSummaryListDto.fromJson(Map<String, dynamic> json) =>
      _$$_MealSummaryListDtoFromJson(json);

  final List<MealSummary> _meals;
  @override
  List<MealSummary> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  @override
  String toString() {
    return 'MealSummaryListDto(meals: $meals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MealSummaryListDto &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_meals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MealSummaryListDtoCopyWith<_$_MealSummaryListDto> get copyWith =>
      __$$_MealSummaryListDtoCopyWithImpl<_$_MealSummaryListDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MealSummaryListDtoToJson(
      this,
    );
  }
}

abstract class _MealSummaryListDto implements MealSummaryListDto {
  const factory _MealSummaryListDto({required final List<MealSummary> meals}) =
      _$_MealSummaryListDto;

  factory _MealSummaryListDto.fromJson(Map<String, dynamic> json) =
      _$_MealSummaryListDto.fromJson;

  @override
  List<MealSummary> get meals;
  @override
  @JsonKey(ignore: true)
  _$$_MealSummaryListDtoCopyWith<_$_MealSummaryListDto> get copyWith =>
      throw _privateConstructorUsedError;
}
