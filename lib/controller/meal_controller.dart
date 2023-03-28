import 'package:gogreen_client/models/input/meal_input.dart';
import 'package:gogreen_client/repository/firebase/firebase_storage.dart';
import 'package:gogreen_client/repository/meal/meal_repository.dart';
import 'package:gogreen_client/util/generate_random_id.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../models/meal.dart';
import '../models/meal_summary.dart';
import '../repository/meal/payload/meal_payload.dart';

final MealRepository mealRepository = MealRepository();

Future<Meal?> createMeal(MealInput input) async {
  String date = DateFormat('yyyy-MM-dd').format(input.date);
  String path = 'meals/${date}_${input.title}_${generateRandomId()}';

  String? photoUrl = input.photo == null
      ? null
      : await input.photo!.join(
          (XFile image) => uploadImageToFirebase(image, path),
          (String url) => url,
        );

  return mealRepository.createMeal(MealPayload(
    title: input.title,
    date: date,
    recipeId: input.recipeId,
    memo: input.memo,
    photo: photoUrl,
  ));
}

Future<List<MealSummary>> getMealsByDate(String userId, DateTime date) async {
  return mealRepository.getMealsByDate(userId, date);
}

Future<List<MealSummary>> getMealsByType(String? typeId) async {
  return mealRepository.getMealsByType(typeId);
}

Future<Meal?> getMealById(String mealId) async {
  return mealRepository.getMealById(mealId);
}

Future<Meal?> updateMeal(String mealId, MealInput meal) async {
  String date = DateFormat('yyyy-MM-dd').format(meal.date);
  String path = 'meals/${date}_${meal.title}_${generateRandomId()}';

  String? photoUrl = meal.photo == null
      ? null
      : await meal.photo!.join(
          (XFile image) => uploadImageToFirebase(image, path),
          (String url) => url,
        );

  return mealRepository.updateMeal(
      mealId,
      MealPayload(
        title: meal.title,
        date: date,
        recipeId: meal.recipeId,
        memo: meal.memo,
        photo: photoUrl,
      ));
}

Future<bool> deleteMeal(String mealId) async {
  return mealRepository.deleteMeal(mealId);
}
