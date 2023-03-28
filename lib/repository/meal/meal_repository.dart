import 'package:dio/dio.dart';
import 'package:gogreen_client/models/meal_summary.dart';
import 'package:gogreen_client/repository/meal/payload/meal_payload.dart';
import 'package:intl/intl.dart';

import '../../models/meal.dart';
import '../dio/dio.dart';
import 'dto/meal_summary_list_dto.dart';

class MealRepository {
  final Dio _dio = createDio();

  Future<Meal?> createMeal(MealPayload meal) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/meals',
        data: meal.toJson(),
      );

      return Meal.fromJson(response.data!);
    } catch (e) {
      return null;
    }
  }

  Future<List<MealSummary>> getMealsByDate(String userId, DateTime date) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/meals/users/$userId',
        queryParameters: {
          'date': DateFormat('yyyy-MM-dd').format(date),
        },
      );

      MealSummaryListDto mealSummaryListDto =
          MealSummaryListDto.fromJson(response.data!);

      return mealSummaryListDto.meals;
    } catch (e) {
      return [];
    }
  }

  Future<List<MealSummary>> getMealsByType(String? typeId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/meals',
        queryParameters: typeId != null ? {'typeId': typeId} : null,
      );

      MealSummaryListDto mealSummaryListDto =
          MealSummaryListDto.fromJson(response.data!);

      return mealSummaryListDto.meals;
    } catch (e) {
      return [];
    }
  }

  Future<Meal?> getMealById(String mealId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/meals/$mealId',
      );

      return Meal.fromJson(response.data!);
    } catch (e) {
      return null;
    }
  }

  Future<Meal?> updateMeal(String mealId, MealPayload meal) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/meals/$mealId',
        data: meal.toJson(),
      );

      return Meal.fromJson(response.data!);
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteMeal(String mealId) async {
    try {
      await _dio.delete<Map<String, dynamic>>(
        '/meals/$mealId',
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
