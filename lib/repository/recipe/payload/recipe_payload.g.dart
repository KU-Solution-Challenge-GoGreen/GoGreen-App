// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipePayload _$$_RecipePayloadFromJson(Map<String, dynamic> json) =>
    _$_RecipePayload(
      name: json['name'] as String,
      duration: json['duration'] as int,
      ingredientIds: (json['ingredientIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => StepPayload.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecipePayloadToJson(_$_RecipePayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'duration': instance.duration,
      'ingredientIds': instance.ingredientIds,
      'steps': instance.steps,
    };
