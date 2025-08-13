import 'package:flutter/material.dart';
import 'package:homework_34/data/models/auth_models/register_models.dart';
import 'package:homework_34/features/auth/repostories/register_repostiriya.dart';
import 'package:homework_34/features/auth/widgets/sucsefull_widget.dart';

class RegisterViewModel extends ChangeNotifier {
  final RegisterRepository _repo = RegisterRepository();

  bool _loading = false;
  bool get loading => _loading;

  Future<void> register({
    required RegisterModel user,
    required BuildContext context,
  }) async {
    _loading = true;
    notifyListeners();

    final success = await _repo.register(user);

    _loading = false;
    notifyListeners();

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: SucsefullWidget()));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Registration failed")));
    }
  }
}
