// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vegan_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VeganType _$$_VeganTypeFromJson(Map<String, dynamic> json) => _$_VeganType(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryAvailabilityList: (json['categoryAvailabilityList']
              as List<dynamic>)
          .map((e) => CategoryAvailability.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VeganTypeToJson(_$_VeganType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryAvailabilityList': instance.categoryAvailabilityList,
    };
