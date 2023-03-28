import 'package:gogreen_client/models/input/step_input.dart';

class RecipeInput {
  final String name;
  final int duration;
  final List<String> ingredientIds;
  final List<StepInput> steps;

  RecipeInput({
    required this.name,
    required this.duration,
    required this.ingredientIds,
    required this.steps,
  });
}
