import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/data/models/category_models/category_model.dart';

class CategoryViewModel extends ChangeNotifier {
  CategoryViewModel() {
    fetchCategories();
  }

  List<CategoryModel> category = [];
  bool isLoading = true;
  String? error;

  Future<void> fetchCategories() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      var response = await dio.get('/categories/list');
      if (response.statusCode == 200) {
        category = (response.data as List)
            .map((x) => CategoryModel.fromJson(x))
            .toList();
      } else {
        error = "Xato statuslar: ${response.statusCode}";
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
