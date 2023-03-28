// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IngredientListDto _$IngredientListDtoFromJson(Map<String, dynamic> json) {
  return _IngredientListDto.fromJson(json);
}

/// @nodoc
mixin _$IngredientListDto {
  List<Ingredient> get ingredientList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientListDtoCopyWith<IngredientListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientListDtoCopyWith<$Res> {
  factory $IngredientListDtoCopyWith(
          IngredientListDto value, $Res Function(IngredientListDto) then) =
      _$IngredientListDtoCopyWithImpl<$Res, IngredientListDto>;
  @useResult
  $Res call({List<Ingredient> ingredientList});
}

/// @nodoc
class _$IngredientListDtoCopyWithImpl<$Res, $Val extends IngredientListDto>
    implements $IngredientListDtoCopyWith<$Res> {
  _$IngredientListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredientList = null,
  }) {
    return _then(_value.copyWith(
      ingredientList: null == ingredientList
          ? _value.ingredientList
          : ingredientList // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IngredientListDtoCopyWith<$Res>
    implements $IngredientListDtoCopyWith<$Res> {
  factory _$$_IngredientListDtoCopyWith(_$_IngredientListDto value,
          $Res Function(_$_IngredientListDto) then) =
      __$$_IngredientListDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Ingredient> ingredientList});
}

/// @nodoc
class __$$_IngredientListDtoCopyWithImpl<$Res>
    extends _$IngredientListDtoCopyWithImpl<$Res, _$_IngredientListDto>
    implements _$$_IngredientListDtoCopyWith<$Res> {
  __$$_IngredientListDtoCopyWithImpl(
      _$_IngredientListDto _value, $Res Function(_$_IngredientListDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredientList = null,
  }) {
    return _then(_$_IngredientListDto(
      ingredientList: null == ingredientList
          ? _value._ingredientList
          : ingredientList // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IngredientListDto implements _IngredientListDto {
  const _$_IngredientListDto({required final List<Ingredient> ingredientList})
      : _ingredientList = ingredientList;

  factory _$_IngredientListDto.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientListDtoFromJson(json);

  final List<Ingredient> _ingredientList;
  @override
  List<Ingredient> get ingredientList {
    if (_ingredientList is EqualUnmodifiableListView) return _ingredientList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredientList);
  }

  @override
  String toString() {
    return 'IngredientListDto(ingredientList: $ingredientList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientListDto &&
            const DeepCollectionEquality()
                .equals(other._ingredientList, _ingredientList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ingredientList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IngredientListDtoCopyWith<_$_IngredientListDto> get copyWith =>
      __$$_IngredientListDtoCopyWithImpl<_$_IngredientListDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientListDtoToJson(
      this,
    );
  }
}

abstract class _IngredientListDto implements IngredientListDto {
  const factory _IngredientListDto(
      {required final List<Ingredient> ingredientList}) = _$_IngredientListDto;

  factory _IngredientListDto.fromJson(Map<String, dynamic> json) =
      _$_IngredientListDto.fromJson;

  @override
  List<Ingredient> get ingredientList;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientListDtoCopyWith<_$_IngredientListDto> get copyWith =>
      throw _privateConstructorUsedError;
}
