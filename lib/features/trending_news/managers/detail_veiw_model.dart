import 'package:flutter/material.dart';
import 'package:homework_34/data/models/trending/detail_model.dart';
import 'package:homework_34/data/repostories/trending_repostory.dart';

class DetailViewModel extends ChangeNotifier {
  final AllRepository allRepository;
  final DetailRepository detailRepository;

  DetailViewModel({
    required this.allRepository,
    required this.detailRepository,
  });

  List<DetailModel> recipes = [];
  DetailModel? recipe;

  bool isLoading = false;
  String? error;
  Future<void> fetchAllRecipes() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await allRepository.getRecipesList();
    result.fold(
      (err) => error = err.toString(),
      (data) => recipes = data,
    );

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchRecipeById(int id) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await detailRepository.fetchRecipeById(id);
    result.fold(
      (err) => error = err.toString(),
      (data) => recipe = data,
    );

    isLoading = false;
    notifyListeners();
  }
}
