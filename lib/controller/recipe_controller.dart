import 'package:gogreen_client/models/recipe_summary.dart';
import 'package:gogreen_client/repository/firebase/firebase_storage.dart';
import 'package:gogreen_client/repository/recipe/recipe_repository.dart';
import 'package:image_picker/image_picker.dart';

import '../models/input/photo_input.dart';
import '../models/input/recipe_input.dart';
import '../models/recipe.dart';
import '../repository/recipe/payload/recipe_payload.dart';
import '../repository/recipe/payload/step_payload.dart';
import '../util/generate_random_id.dart';

final RecipeRepository recipeRepository = RecipeRepository();

Future<Recipe?> createRecipe(RecipeInput recipe) async {
  //recipe.steps 안의 사진들을 firebase에 업로드하는 과정
  final List<Future<String?>> uploadSessions =
      recipe.steps.asMap().entries.map((entry) {
    final PhotoInput? photo = entry.value.photo;
    final String path =
        'recipes/${recipe.name}_${generateRandomId()}_${entry.key + 1}';
    return photo == null
        ? Future.value(null)
        : photo.join(
            (XFile image) => uploadImageToFirebase(image, path),
            (String url) => Future.value(url),
          );
  }).toList();

  //Firebase 화이팅!
  List<String?> photoUrls = await Future.wait(uploadSessions);
  return recipeRepository.createRecipe(
    RecipePayload(
      name: recipe.name,
      duration: recipe.duration,
      ingredientIds: recipe.ingredientIds,
      steps: recipe.steps
          .asMap()
          .map((index, step) => MapEntry(
              index,
              StepPayload(
                description: step.description,
                photo: photoUrls[index],
              )))
          .values
          .toList(),
    ),
  );
}

Future<List<RecipeSummary>> getRecipesByUserId(String userId) async {
  return recipeRepository.getRecipesByUserId(userId);
}

Future<List<RecipeSummary>> getBookmarkedRecipes() async {
  return recipeRepository.getBookmarkedRecipes();
}

Future<Recipe?> getRecipeById(String recipeId) async {
  return recipeRepository.getRecipeById(recipeId);
}

Future<bool?> toggleBookmark(String recipeId) async {
  return recipeRepository.toggleBookmark(recipeId);
}
