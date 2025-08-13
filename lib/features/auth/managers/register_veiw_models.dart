import 'package:flutter/material.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/auth_models/register_models.dart';
import 'package:homework_34/data/repostories/auth_repostories/register_repostiriya.dart';
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

    final Result<bool> result = await _repo.register(user);

    result.fold(
      (error) {
        _loading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration failed: ${error.toString()}")),
        );
      },
      (success) {
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
      },
    );
  }
}
