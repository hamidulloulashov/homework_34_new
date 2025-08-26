import 'package:flutter/material.dart';
import 'package:homework_34/data/models/your_recipies_models/your_recipeis_model.dart';
import 'package:homework_34/data/repostories/your_recipies_repostory.dart';

class YourRecipeisVeiwModel extends ChangeNotifier {
  final YourRecipiesRepostory? repository; 
  List<YourRecipeisModel> recipes = [];
  bool isLoading = false;
  String? error;

  YourRecipeisVeiwModel([this.repository]) { 
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    if (repository == null) {
      error = "Repository mavjud emas";
      recipes = [];
      notifyListeners();
      return;
    }

    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final result = await repository!.fetchAllRecipes();

      if (result.isSuccess && result.data != null) {
        recipes = result.data!;
      } else {
        recipes = [];
        error = result.exception?.toString() ?? "Nomalum xatolik";
      }
    } catch (e) {
      error = "Network xatosi: $e";
      recipes = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
