import 'package:flutter/material.dart';
import 'package:homework_34/data/models/auth_models/login_model.dart';
import 'package:homework_34/features/auth/repostories/login_respostory.dart';

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
    try {
      final token = await _repo.login(
        LoginModel(login: login, password: password),
      );
      _loading = false;
      notifyListeners();
      if (token != null && token.isNotEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login successful")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid login or password")),
        );
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }
}
