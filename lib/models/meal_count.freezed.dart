// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MealCount _$MealCountFromJson(Map<String, dynamic> json) {
  return _MealCount.fromJson(json);
}

/// @nodoc
mixin _$MealCount {
  DateTime get date => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MealCountCopyWith<MealCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealCountCopyWith<$Res> {
  factory $MealCountCopyWith(MealCount value, $Res Function(MealCount) then) =
      _$MealCountCopyWithImpl<$Res, MealCount>;
  @useResult
  $Res call({DateTime date, int count});
}

/// @nodoc
class _$MealCountCopyWithImpl<$Res, $Val extends MealCount>
    implements $MealCountCopyWith<$Res> {
  _$MealCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MealCountCopyWith<$Res> implements $MealCountCopyWith<$Res> {
  factory _$$_MealCountCopyWith(
          _$_MealCount value, $Res Function(_$_MealCount) then) =
      __$$_MealCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int count});
}

/// @nodoc
class __$$_MealCountCopyWithImpl<$Res>
    extends _$MealCountCopyWithImpl<$Res, _$_MealCount>
    implements _$$_MealCountCopyWith<$Res> {
  __$$_MealCountCopyWithImpl(
      _$_MealCount _value, $Res Function(_$_MealCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? count = null,
  }) {
    return _then(_$_MealCount(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MealCount implements _MealCount {
  const _$_MealCount({required this.date, required this.count});

  factory _$_MealCount.fromJson(Map<String, dynamic> json) =>
      _$$_MealCountFromJson(json);

  @override
  final DateTime date;
  @override
  final int count;

  @override
  String toString() {
    return 'MealCount(date: $date, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MealCount &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MealCountCopyWith<_$_MealCount> get copyWith =>
      __$$_MealCountCopyWithImpl<_$_MealCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MealCountToJson(
      this,
    );
  }
}

abstract class _MealCount implements MealCount {
  const factory _MealCount(
      {required final DateTime date, required final int count}) = _$_MealCount;

  factory _MealCount.fromJson(Map<String, dynamic> json) =
      _$_MealCount.fromJson;

  @override
  DateTime get date;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_MealCountCopyWith<_$_MealCount> get copyWith =>
      throw _privateConstructorUsedError;
}
