import 'package:flutter/material.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/auth_models/login_model.dart';
import 'package:homework_34/data/repostories/auth_repostories/login_respostory.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginRepository _repo = LoginRepository();
  bool _loading = false;
  bool get loading => _loading;
  Future<void> login({
    required String login,
    required String password,
    required BuildContext context,
  }) async {
    _loading = true;
    notifyListeners();
    final Result<String> result = await _repo.login(
      LoginModel(login: login, password: password),
    );

    result.fold(
      (error) {
        _loading = false;
        notifyListeners();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: ${error.toString()}")));
      },
      (token) {
        _loading = false;
        notifyListeners();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login successful")));
      },
    );
  }
}
