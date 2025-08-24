import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/data/models/category_models/detail_model.dart';

class DetailsViewModel extends ChangeNotifier {
  List<RecipeModel> recipes = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchRecipes(int categoryId) async {
    try {
      isLoading = true;
      error = null;
      recipes = [];
      notifyListeners();

      final result = await ApiClient().get<List<dynamic>>('/recipes/list');
      result.fold(
        (err) => error = err.toString(),
        (data) {
          recipes = data
              .map((x) => RecipeModel.fromJson(Map<String, dynamic>.from(x)))
              .where((recipe) => recipe.categoryId == categoryId)
              .toList();
        },
      );
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
