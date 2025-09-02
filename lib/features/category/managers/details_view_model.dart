import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/result.dart';
import 'package:homework_34/data/models/recipe/recipies_model.dart';
import 'package:homework_34/data/repostories/categories_repostory.dart';
class DetailsViewModel extends ChangeNotifier {
  final DetailsRepository repository;

  DetailsViewModel({DetailsRepository? repository})
      : repository = repository ?? DetailsRepository();

  List<RecipeModel> recipes = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchRecipes(int categoryId) async {
    isLoading = true;
    error = null;
    recipes = [];
    notifyListeners();

    try {
      final Result<List<RecipeModel>> result = await repository.fetchRecipes(categoryId);

      result.fold(
        (err) => error = err.toString(),
        (data) => recipes = data,
      );
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
