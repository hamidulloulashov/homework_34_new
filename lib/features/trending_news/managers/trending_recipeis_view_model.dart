import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/data/models/trending_repostories_models/most_model.dart';

class TrendingViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  List<TrendingModels> menus = [];

  Future<void> fetchMenu() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await dio.get('recipes/trending-recipe');
      final data = response.data;

      if (data is List) {
        menus = data
            .map((e) => TrendingModels.fromJson(Map<String, dynamic>.from(e)))
            .toList();
      } else if (data is Map) {
        menus = [TrendingModels.fromJson(Map<String, dynamic>.from(data))];
      } else {
        menus = [];
      }
      error = null;
    } catch (e) {
      error = e.toString();
      menus = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
