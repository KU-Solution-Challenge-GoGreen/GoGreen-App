import 'package:dio/dio.dart';

import '../../models/ingredient.dart';
import '../dio/dio.dart';
import 'dto/ingredient_list_dto.dart';

class IngredientRepository {
  final Dio _dio = createDio();

  Future<List<Ingredient>> getIngredientList() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/ingredients');

      IngredientListDto ingredientListDto =
          IngredientListDto.fromJson(response.data!);

      return ingredientListDto.ingredientList;
    } catch (e) {
      return [];
    }
  }
}
