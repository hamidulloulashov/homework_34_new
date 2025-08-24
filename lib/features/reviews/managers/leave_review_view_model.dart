import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/category_models/reviews_model.dart';

class LeaveReviewViewModel extends ChangeNotifier {
  final int recipeId;

  LeaveReviewViewModel({required this.recipeId}) {
    fetchRecipeDetail();
  }
  ReviewsModel? recipe;
  bool isLoading = true;
  String? error;

  Future<void> fetchRecipeDetail() async {
    try {
      isLoading = true;
      error = null;
      recipe = null;
      notifyListeners();

      final Result<Map<String, dynamic>> result = await ApiClient().get<Map<String, dynamic>>(
        '/recipes/create-review/$recipeId',
      );
      result.fold(
        (err) => error = err.toString(),
        (data) {
          recipe = ReviewsModel.fromJson(data);
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
