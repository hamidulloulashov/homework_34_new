import 'package:flutter/material.dart';
import 'package:homework_34/data/models/category_models/category_model.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/repostories/categories_repostory.dart';

class CategoryViewModel extends ChangeNotifier {
  final CategoryRepository repository;
  CategoryViewModel({CategoryRepository? repository})
      : repository = repository ?? CategoryRepository() {
    fetchCategories();
  }

  List<CategoryModel> categories = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchCategories() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final Result<List<CategoryModel>> result = await repository.fetchCategories();

    result.fold(
      (err) => error = err.toString(),
      (data) => categories = data,
    );

    isLoading = false;
    notifyListeners();
  }
}
