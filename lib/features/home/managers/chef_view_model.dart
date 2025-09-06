import 'package:flutter/material.dart';

import '../../../data/models/home/models/home_page_model/chefs_models.dart';
import '../../../data/repostories/home_repostory.dart';
class ChefViewModel extends ChangeNotifier {
  final Repository repository;
  ChefViewModel({required this.repository});

  List<ChefsModels> chef = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchChefs() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await repository.getTopChefs();
    if (result.isSuccess) {
      chef = result.data!;
    } else {
      error = result.exception.toString();
      chef = [];
    }

    isLoading = false;
    notifyListeners();
  }
}
