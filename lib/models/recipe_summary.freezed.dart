// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeSummary _$RecipeSummaryFromJson(Map<String, dynamic> json) {
  return _RecipeSummary.fromJson(json);
}

/// @nodoc
mixin _$RecipeSummary {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeSummaryCopyWith<RecipeSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeSummaryCopyWith<$Res> {
  factory $RecipeSummaryCopyWith(
          RecipeSummary value, $Res Function(RecipeSummary) then) =
      _$RecipeSummaryCopyWithImpl<$Res, RecipeSummary>;
  @useResult
  $Res call({String id, String name, List<String> photos});
}

/// @nodoc
class _$RecipeSummaryCopyWithImpl<$Res, $Val extends RecipeSummary>
    implements $RecipeSummaryCopyWith<$Res> {
  _$RecipeSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photos = null,
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
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeSummaryCopyWith<$Res>
    implements $RecipeSummaryCopyWith<$Res> {
  factory _$$_RecipeSummaryCopyWith(
          _$_RecipeSummary value, $Res Function(_$_RecipeSummary) then) =
      __$$_RecipeSummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, List<String> photos});
}

/// @nodoc
class __$$_RecipeSummaryCopyWithImpl<$Res>
    extends _$RecipeSummaryCopyWithImpl<$Res, _$_RecipeSummary>
    implements _$$_RecipeSummaryCopyWith<$Res> {
  __$$_RecipeSummaryCopyWithImpl(
      _$_RecipeSummary _value, $Res Function(_$_RecipeSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photos = null,
  }) {
    return _then(_$_RecipeSummary(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeSummary implements _RecipeSummary {
  const _$_RecipeSummary(
      {required this.id,
      required this.name,
      required final List<String> photos})
      : _photos = photos;

  factory _$_RecipeSummary.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeSummaryFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<String> _photos;
  @override
  List<String> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'RecipeSummary(id: $id, name: $name, photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeSummary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeSummaryCopyWith<_$_RecipeSummary> get copyWith =>
      __$$_RecipeSummaryCopyWithImpl<_$_RecipeSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeSummaryToJson(
      this,
    );
  }
}

abstract class _RecipeSummary implements RecipeSummary {
  const factory _RecipeSummary(
      {required final String id,
      required final String name,
      required final List<String> photos}) = _$_RecipeSummary;

  factory _RecipeSummary.fromJson(Map<String, dynamic> json) =
      _$_RecipeSummary.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<String> get photos;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeSummaryCopyWith<_$_RecipeSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
