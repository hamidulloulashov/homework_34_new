import 'package:flutter/material.dart';
import 'package:homework_34/data/models/home/models/home_page_model/trending_models.dart';
import 'package:homework_34/data/repostories/home_repostory.dart';
class TrendingViewModel extends ChangeNotifier {
  final Repository repository;
  TrendingViewModel({required this.repository});

  List<TrendingModels> trending = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchTrending() async {
    isLoading = true;
    notifyListeners();

    final result = await repository.getTrending();
    if (result.isSuccess) {
      trending = result.data!;
      error = null;
    } else {
      error = result.exception.toString();
      trending = [];
    }

    isLoading = false;
    notifyListeners();
  }
}
