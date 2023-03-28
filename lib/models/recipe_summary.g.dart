// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeSummary _$$_RecipeSummaryFromJson(Map<String, dynamic> json) =>
    _$_RecipeSummary(
      id: json['id'] as String,
      name: json['name'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_RecipeSummaryToJson(_$_RecipeSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photos': instance.photos,
    };
