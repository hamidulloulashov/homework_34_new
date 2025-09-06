import 'package:flutter/material.dart';
import 'package:homework_34/data/models/home/models/home_page_model/recepi_models.dart';
import 'package:homework_34/data/repostories/home_repostory.dart';
class RecipeViewModel extends ChangeNotifier {
  final Repository repository;
  RecipeViewModel({required this.repository});

  List<RecepiModels> recipes = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchRecipes() async {
    isLoading = true;
    notifyListeners();

    final result = await repository.getRecipes();
    if (result.isSuccess) {
      recipes = result.data!;
      error = null;
    } else {
      error = result.exception.toString();
      recipes = [];
    }

    isLoading = false;
    notifyListeners();
  }
}
