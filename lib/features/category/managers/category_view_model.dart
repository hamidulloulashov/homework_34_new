import 'package:flutter/material.dart';
import 'package:homework_34/data/models/category/category_model.dart';
import 'package:homework_34/core/utils/result.dart';
import 'package:homework_34/data/repostories/categories_repostory.dart' show CategoryRepository; 

class CategoryViewModel extends ChangeNotifier {
  final CategoryRepository repository;
  
  CategoryViewModel({required this.repository}) {
    fetchCategories();
  }

  List<CategoryModel> categories = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchCategories() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final Result<List<CategoryModel>> result = await repository.fetchCategories();

      result.fold(
        (err) => error = err.toString(),
        (data) => categories = data,
      );
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  void refresh() {
    fetchCategories();
  }
}