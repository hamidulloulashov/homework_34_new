import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/data/models/category_models/reviews_model.dart';

class ReviewsViewModel extends ChangeNotifier {
  final int recipeId;

  ReviewsViewModel({required this.recipeId}) {
    fetchReviews();
  }

  List<ReviewsModel> reviews = [];
  bool isLoading = true;
  String? error;

  Future<void> fetchReviews() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final result = await ApiClient().get<dynamic>(
        '/recipes/create-review/$recipeId',
      );

      result.fold(
        (err) {
          error = err.toString();
        },
        (data) {
          if (data is List) {
            reviews = data
                .map((e) => ReviewsModel.fromJson(
                      Map<String, dynamic>.from(e),
                    ))
                .toList();
          } else if (data is Map<String, dynamic> && data["reviews"] is List) {
            reviews = (data["reviews"] as List)
                .map((e) => ReviewsModel.fromJson(
                      Map<String, dynamic>.from(e),
                    ))
                .toList();
          } else {
            error = "Reviews topilmadi!";
          }
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
