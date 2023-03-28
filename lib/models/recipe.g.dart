// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      carbonFootprint: (json['carbonFootprint'] as num).toDouble(),
      duration: json['duration'] as int,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => StepData.fromJson(e as Map<String, dynamic>))
          .toList(),
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      isBookmarked: json['isBookmarked'] as bool,
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'carbonFootprint': instance.carbonFootprint,
      'duration': instance.duration,
      'ingredients': instance.ingredients,
      'categories': instance.categories,
      'steps': instance.steps,
      'photos': instance.photos,
      'isBookmarked': instance.isBookmarked,
    };
