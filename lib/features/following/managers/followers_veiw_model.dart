import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/result.dart';
import 'package:homework_34/data/models/following/following_model.dart';
import 'package:homework_34/data/repostories/following_repostory.dart';

class FollowersViewModel extends ChangeNotifier {
  final FollowersRepository repository;

  FollowersViewModel({required this.repository}) {
    fetchFollowers();
  }

  List<FollowingModel> followers = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchFollowers({int userId = 1}) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final Result<List<FollowingModel>> result =
          await repository.fetchFollowers(userId);

      result.fold(
        (err) => error = err.toString(),
        (data) => followers = data,
      );
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  void refresh({int userId = 1}) {
    fetchFollowers(userId: userId);
  }
}
