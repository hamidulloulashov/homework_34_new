import 'package:flutter/material.dart';
import 'package:homework_34/data/models/trending_repostories_models/mosts_.dart';
import 'package:homework_34/data/repostories/trending_repostory.dart';

class MostViewModel extends ChangeNotifier {
  final MostRepository repository;
  bool isLoading = false;
  String? error;
  List<MostModel> menus = [];

  MostViewModel({required this.repository}); 

  Future<void> fetchMenu() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await repository.getTrendingRecipes();

    result.fold(
      (err) {
        error = err.toString();
        menus = [];
      },
      (data) {
        menus = data;
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
