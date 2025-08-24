import 'package:flutter/material.dart';
import 'package:homework_34/data/models/onbording_models/first_page_model.dart';
import 'package:homework_34/data/repostories/onboarding_repostory.dart';

class FirstViewModel extends ChangeNotifier {
  final OnboardingRepository repository;

  FirstViewModel({required this.repository}) {
    fetchCategories();
  }

  List<FirstPageModel> first = [];
  bool isLoading = true;
  String? error;

  Future<void> fetchCategories() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await repository.getFirstPage();

    result.fold(
      (err) => error = err.toString(),
      (data) => first = data!,
    );

    isLoading = false;
    notifyListeners();
  }
}
