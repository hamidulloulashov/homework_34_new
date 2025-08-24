import 'package:flutter/material.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/auth_models/register_model.dart';
import 'package:homework_34/data/repostories/auth_respostory.dart';

class RegisterViewModel extends ChangeNotifier {
  final AuthRepository _repo;
  bool _loading = false;
  bool get loading => _loading;
  bool isSuccess = false;
  String? errorMessage;
  RegisterViewModel({required AuthRepository repo}) : _repo = repo;
  Future<void> register({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String birthDate,
    required String password,
    required BuildContext context,
  }) async {
    _loading = true;
    notifyListeners();

    final user = RegisterModel(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      birthDate: birthDate,
      password: password,
    );

    final Result<String> result = await _repo.register(user);

    _loading = false;
    notifyListeners();

    result.fold((error) {
      print("ViewModelda xatolik: $error");
      errorMessage = error.toString();
    }, (onSuccess) => isSuccess = true);
    _loading = false;
    notifyListeners();
  }
}
