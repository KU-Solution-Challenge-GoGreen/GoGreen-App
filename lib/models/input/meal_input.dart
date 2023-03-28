import 'package:gogreen_client/models/input/photo_input.dart';

class MealInput {
  final String recipeId;
  final String title;
  final String? memo;
  final PhotoInput? photo;
  final DateTime date;

  MealInput({
    required this.recipeId,
    required this.title,
    this.memo,
    this.photo,
    required this.date,
  });
}
