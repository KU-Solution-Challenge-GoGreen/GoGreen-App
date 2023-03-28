import 'package:gogreen_client/repository/ingredient/ingredient_repository.dart';

import '../models/ingredient.dart';

final IngredientRepository ingredientRepository = IngredientRepository();

Future<List<Ingredient>> getIngredientList() async {
  return ingredientRepository.getIngredientList();
}
