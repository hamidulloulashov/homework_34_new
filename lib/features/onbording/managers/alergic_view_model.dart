import 'package:flutter/material.dart';
import 'package:homework_34/data/models/onboarding/cusins_model.dart';
import 'package:homework_34/data/repostories/onboarding_repostory.dart';

class AlergicViewModel extends ChangeNotifier {
  final OnboardingRepository repository;

  AlergicViewModel({required this.repository}) {
    fetchCategories();
  }

  List<CusinsModel> allergic = [];
  bool isLoading = true;
  String? error;

  Future<void> fetchCategories() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await repository.getAllergic();

    result.fold(
      (err) => error = err.toString(),
      (data) => allergic = data!,
    );

    isLoading = false;
    notifyListeners();
  }
}
