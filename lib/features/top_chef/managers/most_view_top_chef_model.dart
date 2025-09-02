import 'package:flutter/material.dart';
import 'package:homework_34/data/models/profile/profile_model.dart';
import 'package:homework_34/data/models/top_chefs/top_chef_model.dart';
import 'package:homework_34/data/models/recipe/recipies_model.dart';
import 'package:homework_34/data/repostories/top_chefs_repostory.dart';

class MostViewTopChefModel extends ChangeNotifier {
  final TopChefsRepostory repository;

  MostViewTopChefModel({required this.repository});

  List<TopChefModel> chefs = [];
  List<ProfileModel> chefDetails = [];
  List<RecipeModel> recipes = [];

  bool isLoading = false;
  String? errorMessage;

  Future<void> loadChefs() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final result = await repository.fetchChefs();

      result.fold(
        (error) {
          errorMessage = error.toString();
          chefs = [];
        },
        (value) {
          chefs = value;
          errorMessage = null;
        },
      );
    } catch (e) {
      errorMessage = 'Unexpected error: $e';
      chefs = [];
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadChefDetails(int id) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final result = await repository.fetchChefsId(id);

      result.fold(
        (error) {
          errorMessage = error.toString();
          chefDetails = [];
        },
        (value) {
          chefDetails = value;
          errorMessage = null;
        },
      );
    } catch (e) {
      errorMessage = 'Unexpected error: $e';
      chefDetails = [];
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadRecipes(String userId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final result = await repository.fetchRecipes(userId);

      result.fold(
        (error) {
          errorMessage = error.toString();
          recipes = [];
        },
        (value) {
          recipes = value;
          errorMessage = null;
        },
      );
    } catch (e) {
      errorMessage = 'Unexpected error: $e';
      recipes = [];
    }

    isLoading = false;
    notifyListeners();
  }
}
