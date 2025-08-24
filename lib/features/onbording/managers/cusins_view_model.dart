import 'package:flutter/material.dart';
import 'package:homework_34/data/models/onbording_models/cusins_model.dart';
import 'package:homework_34/data/repostories/onboarding_repostory.dart';

class CusinsViewModel extends ChangeNotifier {
  final OnboardingRepository repository;

  CusinsViewModel({required this.repository}) {
    fetchCategories();
  }

  List<CusinsModel> cusins = [];
  bool isLoading = true;
  String? error;

  Future<void> fetchCategories() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await repository.getCusins();

    result.fold(
      (err) => error = err.toString(),
      (data) => cusins = data!,
    );

    isLoading = false;
    notifyListeners();
  }
}
