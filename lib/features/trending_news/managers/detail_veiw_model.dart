import 'package:flutter/material.dart';
import 'package:homework_34/data/models/trending_repostories_models/detail_model.dart';
import 'package:homework_34/data/repostories/trending_repostory.dart';

class DetailViewModel extends ChangeNotifier {
  final DetailRepository repository;
  DetailModel? recipe;
  bool isLoading = false;
  String? error;

  DetailViewModel(this.repository);

  Future<void> fetchRecipe(int id) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final result = await repository.fetchRecipeById(id);

      if (result.isSuccess && result.data != null) {
        recipe = result.data!;
      } else {
        recipe = null;
        error = result.exception?.toString() ?? "Nomalum xatolik";
      }
    } catch (e) {
      recipe = null;
      error = "Network xatosi: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
