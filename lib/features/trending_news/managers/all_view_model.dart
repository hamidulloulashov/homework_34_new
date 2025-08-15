import 'package:flutter/material.dart';
import 'package:homework_34/data/models/trending_repostories_models/all_model.dart';
import 'package:homework_34/data/repostories/trending_repostories/all_repostory.dart';

class AllViewModel extends ChangeNotifier {
  final AllRepository repository;
  bool isLoading = false;
  String? error;
  List<AllModel> menus = [];

  AllViewModel(this.repository);

  Future<void> fetchMenu() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final result = await repository.getRecipesList();

      if (result.isSuccess && result.data != null) {
        menus = result.data!;
      } else {
        menus = [];
        error = result.exception?.toString() ?? "Nomalum xatolik";
      }
    } catch (e) {
      menus = [];
      error = "Network xatosi: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
