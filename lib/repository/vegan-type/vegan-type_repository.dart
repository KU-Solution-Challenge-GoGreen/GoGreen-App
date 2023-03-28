import 'package:dio/dio.dart';

import '../../models/vegan_type.dart';
import '../dio/dio.dart';
import 'dto/vegan_type_list_dto.dart';

class VeganTypeRepository {
  final Dio _dio = createDio();

  Future<List<VeganType>> getVeganTypes() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/vegan-type');

      VeganTypeListDto veganTypeListDto =
          VeganTypeListDto.fromJson(response.data!);

      return veganTypeListDto.veganTypeList;
    } catch (e) {
      return [];
    }
  }
}
