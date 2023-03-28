// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vegan_type_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VeganTypeListDto _$$_VeganTypeListDtoFromJson(Map<String, dynamic> json) =>
    _$_VeganTypeListDto(
      veganTypeList: (json['veganTypeList'] as List<dynamic>)
          .map((e) => VeganType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VeganTypeListDtoToJson(_$_VeganTypeListDto instance) =>
    <String, dynamic>{
      'veganTypeList': instance.veganTypeList,
    };
