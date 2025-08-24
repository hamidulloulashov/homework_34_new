import 'package:flutter/material.dart';
import 'package:homework_34/data/models/onbording_models/second_page_model.dart';
import 'package:homework_34/data/repostories/onboarding_repostory.dart';

class SecondViewModel extends ChangeNotifier {
  final OnboardingRepository repository;

  SecondViewModel({required this.repository}) {
    fetchCategories();
  }

  List<SecondPageModels> second = [];
  bool isLoading = true;
  String? error;

  Future<void> fetchCategories() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await repository.getSecondPage();

    result.fold(
      (err) => error = err.toString(),
      (data) => second = data!,
    );

    isLoading = false;
    notifyListeners();
  }
}
