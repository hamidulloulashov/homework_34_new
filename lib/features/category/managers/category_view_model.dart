import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/category_models/category_model.dart';


class CategoryViewModel extends ChangeNotifier {
  CategoryViewModel() {
    fetchCategories();
  }

  List<CategoryModel> categories = [];
  bool isLoading = true;
  String? error;

  Future<void> fetchCategories() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final Result<List<dynamic>> result = await ApiClient().get<List<dynamic>>('/categories/list');
      result.fold(
        (err) => error = err.toString(),
        (data) {
          categories = data
              .map((x) => CategoryModel.fromJson(Map<String, dynamic>.from(x)))
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
