import 'package:dio/dio.dart';
import 'package:gogreen_client/models/recipe_summary.dart';
import 'package:gogreen_client/repository/recipe/payload/recipe_payload.dart';

import '../../models/recipe.dart';
import '../dio/dio.dart';
import 'dto/recipe_summary_list_dto.dart';

class RecipeRepository {
  final Dio _dio = createDio();

  Future<Recipe?> createRecipe(RecipePayload recipe) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/recipes',
        data: recipe.toJson(),
      );

      return Recipe.fromJson(response.data!);
    } catch (e) {
      return null;
    }
  }

  Future<List<RecipeSummary>> getRecipesByUserId(String userId) async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>('/recipes/users/$userId');

      RecipeSummaryListDto recipeSummaryListDto =
          RecipeSummaryListDto.fromJson(response.data!);

      return recipeSummaryListDto.recipes;
    } catch (e) {
      return [];
    }
  }

  Future<List<RecipeSummary>> getBookmarkedRecipes() async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>('/recipes/bookmark');

      RecipeSummaryListDto recipeSummaryListDto =
          RecipeSummaryListDto.fromJson(response.data!);

      return recipeSummaryListDto.recipes;
    } catch (e) {
      return [];
    }
  }

  Future<Recipe?> getRecipeById(String recipeId) async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>('/recipes/$recipeId');

      return Recipe.fromJson(response.data!);
    } catch (e) {
      return null;
    }
  }

  Future<bool?> toggleBookmark(String recipeId) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/recipes/$recipeId/bookmark',
      );

      return response.data!['isBookmarked'];
    } catch (e) {
      return null;
    }
  }
}
