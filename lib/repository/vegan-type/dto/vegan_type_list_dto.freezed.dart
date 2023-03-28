// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vegan_type_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VeganTypeListDto _$VeganTypeListDtoFromJson(Map<String, dynamic> json) {
  return _VeganTypeListDto.fromJson(json);
}

/// @nodoc
mixin _$VeganTypeListDto {
  List<VeganType> get veganTypeList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VeganTypeListDtoCopyWith<VeganTypeListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VeganTypeListDtoCopyWith<$Res> {
  factory $VeganTypeListDtoCopyWith(
          VeganTypeListDto value, $Res Function(VeganTypeListDto) then) =
      _$VeganTypeListDtoCopyWithImpl<$Res, VeganTypeListDto>;
  @useResult
  $Res call({List<VeganType> veganTypeList});
}

/// @nodoc
class _$VeganTypeListDtoCopyWithImpl<$Res, $Val extends VeganTypeListDto>
    implements $VeganTypeListDtoCopyWith<$Res> {
  _$VeganTypeListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? veganTypeList = null,
  }) {
    return _then(_value.copyWith(
      veganTypeList: null == veganTypeList
          ? _value.veganTypeList
          : veganTypeList // ignore: cast_nullable_to_non_nullable
              as List<VeganType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VeganTypeListDtoCopyWith<$Res>
    implements $VeganTypeListDtoCopyWith<$Res> {
  factory _$$_VeganTypeListDtoCopyWith(
          _$_VeganTypeListDto value, $Res Function(_$_VeganTypeListDto) then) =
      __$$_VeganTypeListDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<VeganType> veganTypeList});
}

/// @nodoc
class __$$_VeganTypeListDtoCopyWithImpl<$Res>
    extends _$VeganTypeListDtoCopyWithImpl<$Res, _$_VeganTypeListDto>
    implements _$$_VeganTypeListDtoCopyWith<$Res> {
  __$$_VeganTypeListDtoCopyWithImpl(
      _$_VeganTypeListDto _value, $Res Function(_$_VeganTypeListDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? veganTypeList = null,
  }) {
    return _then(_$_VeganTypeListDto(
      veganTypeList: null == veganTypeList
          ? _value._veganTypeList
          : veganTypeList // ignore: cast_nullable_to_non_nullable
              as List<VeganType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VeganTypeListDto implements _VeganTypeListDto {
  const _$_VeganTypeListDto({required final List<VeganType> veganTypeList})
      : _veganTypeList = veganTypeList;

  factory _$_VeganTypeListDto.fromJson(Map<String, dynamic> json) =>
      _$$_VeganTypeListDtoFromJson(json);

  final List<VeganType> _veganTypeList;
  @override
  List<VeganType> get veganTypeList {
    if (_veganTypeList is EqualUnmodifiableListView) return _veganTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_veganTypeList);
  }

  @override
  String toString() {
    return 'VeganTypeListDto(veganTypeList: $veganTypeList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VeganTypeListDto &&
            const DeepCollectionEquality()
                .equals(other._veganTypeList, _veganTypeList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_veganTypeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VeganTypeListDtoCopyWith<_$_VeganTypeListDto> get copyWith =>
      __$$_VeganTypeListDtoCopyWithImpl<_$_VeganTypeListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VeganTypeListDtoToJson(
      this,
    );
  }
}

abstract class _VeganTypeListDto implements VeganTypeListDto {
  const factory _VeganTypeListDto(
      {required final List<VeganType> veganTypeList}) = _$_VeganTypeListDto;

  factory _VeganTypeListDto.fromJson(Map<String, dynamic> json) =
      _$_VeganTypeListDto.fromJson;

  @override
  List<VeganType> get veganTypeList;
  @override
  @JsonKey(ignore: true)
  _$$_VeganTypeListDtoCopyWith<_$_VeganTypeListDto> get copyWith =>
      throw _privateConstructorUsedError;
}
