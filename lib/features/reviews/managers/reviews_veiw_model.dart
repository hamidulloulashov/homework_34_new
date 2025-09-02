import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/utils/result.dart';
import 'package:homework_34/data/models/category/reviews_model.dart';
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
      reviews = [];
      notifyListeners();

      final Result<dynamic> result = await ApiClient().get<dynamic>(
        '/recipes/reviews/detail/$recipeId',
      );

      result.fold(
        (err) => error = err.toString(),
        (data) {
          print('API Response: $data'); 
          print('Response type: ${data.runtimeType}'); 
          
          if (data is Map<String, dynamic>) {
            if (data.containsKey('reviews') && data['reviews'] is List) {
              final reviewsList = data['reviews'] as List;
              reviews = reviewsList
                  .map((x) => ReviewsModel.fromJson(
                        Map<String, dynamic>.from(x),
                      ))
                  .toList();
            } else if (data.containsKey('data') && data['data'] is List) {
              final reviewsList = data['data'] as List;
              reviews = reviewsList
                  .map((x) => ReviewsModel.fromJson(
                        Map<String, dynamic>.from(x),
                      ))
                  .toList();
            } else if (data.containsKey('results') && data['results'] is List) {
              final reviewsList = data['results'] as List;
              reviews = reviewsList
                  .map((x) => ReviewsModel.fromJson(
                        Map<String, dynamic>.from(x),
                      ))
                  .toList();
            } else {
          
              reviews = [];
              print('No reviews array found in response');
            }
          } else if (data is List) {
        
            reviews = data
                .map((x) => ReviewsModel.fromJson(
                      Map<String, dynamic>.from(x),
                    ))
                .toList();
          } else {
            error = 'Unexpected response format';
            print('Unexpected data type: ${data.runtimeType}');
          }
        },
      );
    } catch (e) {
      error = e.toString();
      print('Error in fetchReviews: $e'); 
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}