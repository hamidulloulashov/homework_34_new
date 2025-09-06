import 'package:flutter/material.dart';
import 'package:homework_34/data/models/home/models/home_page_model/resently_models.dart';
import 'package:homework_34/data/repostories/home_repostory.dart';
class RecentlyViewModel extends ChangeNotifier {
  final Repository repository;
  RecentlyViewModel({required this.repository});

  List<ResentlyModels> recipes = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchRecently() async {
    isLoading = true;
    notifyListeners();

    final result = await repository.getRecently();
    if (result.isSuccess) {
      recipes = result.data!;
      error = null;
    } else {
      error = result.exception.toString();
      recipes = [];
    }

    isLoading = false;
    notifyListeners();
  }
}
