import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/result.dart';
import 'package:homework_34/data/models/following/following_model.dart';
import 'package:homework_34/data/repostories/following_repostory.dart';

class FollowingVeiwModel extends ChangeNotifier {
  final FollowingRepostory repository;
  
  FollowingVeiwModel({required this.repository}) {
    fetchCategories();
  }

  List<FollowingModel> following = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchCategories() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final Result<List<FollowingModel>> result = await repository.fetchCategories();

      result.fold(
        (err) => error = err.toString(),
        (data) => following = data,
      );
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  void refresh() {
    fetchCategories();
  }
}