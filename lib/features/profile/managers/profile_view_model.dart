import 'package:flutter/material.dart';
import 'package:homework_34/data/models/profile/profile_model.dart';
import 'package:homework_34/data/repostories/profile_repostory.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileRepostory profileRepostory;

  ProfileViewModel({required this.profileRepostory});

  ProfileModel? _profile;
  ProfileModel? get profile => _profile;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchProfile() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await profileRepostory.fetchProfile();
    result.fold(
      (err) {
        _error = err.toString();
        _profile = null;
      },
      (data) {
        _profile = data;
      },
    );

    _isLoading = false;
    notifyListeners();
  }
}
