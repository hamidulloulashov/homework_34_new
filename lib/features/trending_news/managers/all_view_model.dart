import 'package:flutter/material.dart';
import 'package:homework_34/data/models/trending_repostories_models/all_model.dart'; 
import 'package:homework_34/data/repostories/trending_repostory.dart' as trending;

class AllViewModel extends ChangeNotifier {
  final trending.AllRepository repository; 
  bool isLoading = false;
  String? error;
  List<AllModel> menus = [];

  AllViewModel({required this.repository});

  Future<void> fetchMenu() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await repository.getRecipesList(); 

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