import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/vegan_type.dart';

part 'vegan_type_list_dto.freezed.dart';
part 'vegan_type_list_dto.g.dart';

@freezed
class VeganTypeListDto with _$VeganTypeListDto {
  const factory VeganTypeListDto({
    required List<VeganType> veganTypeList,
  }) = _VeganTypeListDto;

  factory VeganTypeListDto.fromJson(Map<String, dynamic> json) =>
      _$VeganTypeListDtoFromJson(json);
}
