// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_summary_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeSummaryListDto _$RecipeSummaryListDtoFromJson(Map<String, dynamic> json) {
  return _RecipeSummaryListDto.fromJson(json);
}

/// @nodoc
mixin _$RecipeSummaryListDto {
  List<RecipeSummary> get recipes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeSummaryListDtoCopyWith<RecipeSummaryListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeSummaryListDtoCopyWith<$Res> {
  factory $RecipeSummaryListDtoCopyWith(RecipeSummaryListDto value,
          $Res Function(RecipeSummaryListDto) then) =
      _$RecipeSummaryListDtoCopyWithImpl<$Res, RecipeSummaryListDto>;
  @useResult
  $Res call({List<RecipeSummary> recipes});
}

/// @nodoc
class _$RecipeSummaryListDtoCopyWithImpl<$Res,
        $Val extends RecipeSummaryListDto>
    implements $RecipeSummaryListDtoCopyWith<$Res> {
  _$RecipeSummaryListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
  }) {
    return _then(_value.copyWith(
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummary>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeSummaryListDtoCopyWith<$Res>
    implements $RecipeSummaryListDtoCopyWith<$Res> {
  factory _$$_RecipeSummaryListDtoCopyWith(_$_RecipeSummaryListDto value,
          $Res Function(_$_RecipeSummaryListDto) then) =
      __$$_RecipeSummaryListDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RecipeSummary> recipes});
}

/// @nodoc
class __$$_RecipeSummaryListDtoCopyWithImpl<$Res>
    extends _$RecipeSummaryListDtoCopyWithImpl<$Res, _$_RecipeSummaryListDto>
    implements _$$_RecipeSummaryListDtoCopyWith<$Res> {
  __$$_RecipeSummaryListDtoCopyWithImpl(_$_RecipeSummaryListDto _value,
      $Res Function(_$_RecipeSummaryListDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
  }) {
    return _then(_$_RecipeSummaryListDto(
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummary>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeSummaryListDto implements _RecipeSummaryListDto {
  const _$_RecipeSummaryListDto({required final List<RecipeSummary> recipes})
      : _recipes = recipes;

  factory _$_RecipeSummaryListDto.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeSummaryListDtoFromJson(json);

  final List<RecipeSummary> _recipes;
  @override
  List<RecipeSummary> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  String toString() {
    return 'RecipeSummaryListDto(recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeSummaryListDto &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeSummaryListDtoCopyWith<_$_RecipeSummaryListDto> get copyWith =>
      __$$_RecipeSummaryListDtoCopyWithImpl<_$_RecipeSummaryListDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeSummaryListDtoToJson(
      this,
    );
  }
}

abstract class _RecipeSummaryListDto implements RecipeSummaryListDto {
  const factory _RecipeSummaryListDto(
      {required final List<RecipeSummary> recipes}) = _$_RecipeSummaryListDto;

  factory _RecipeSummaryListDto.fromJson(Map<String, dynamic> json) =
      _$_RecipeSummaryListDto.fromJson;

  @override
  List<RecipeSummary> get recipes;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeSummaryListDtoCopyWith<_$_RecipeSummaryListDto> get copyWith =>
      throw _privateConstructorUsedError;
}
