import 'package:flutter/material.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/auth_models/login_model.dart';
import 'package:homework_34/data/repostories/auth_respostory.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _repo;
  bool _loading = false;
  bool get loading => _loading;
  bool isSuccess = false;
  String? errorMessage;
  LoginViewModel({required AuthRepository repo}) : _repo = repo;
  Future<void> login({required String login, required String password}) async {
    _loading = true;
    notifyListeners();
    final Result<String> result = await _repo.login(
      LoginModel(login: login, password: password),
    );
    result.fold(
      (error) => errorMessage = error.toString(),
      (onSuccess) => isSuccess = true,
    );
    _loading = false;
    notifyListeners();
  }
}
