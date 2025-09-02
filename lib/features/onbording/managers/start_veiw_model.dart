import 'package:flutter/material.dart';
import 'package:homework_34/data/models/onboarding/start_model.dart';
import 'package:homework_34/data/repostories/onboarding_repostory.dart';

class StartVeiwModel extends ChangeNotifier {
  final OnboardingRepository repository;

  StartVeiwModel({required this.repository}) {
    fetchCategories();
  }

  List<StartModel> start = [];
  bool isLoading = true;
  String? error;

  get second => null;
  Future<void> fetchCategories() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await repository.getFirstPage();

    result.fold(
      (err) => error = err.toString(),
      (data) => start = data!,
    );

    isLoading = false;
    notifyListeners();
  }
}
