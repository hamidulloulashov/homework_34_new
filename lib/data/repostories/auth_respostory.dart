import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/lokal_data_storege/token_storage.dart';
import 'package:homework_34/core/utils/result.dart';
import 'package:homework_34/data/models/auth/login_model.dart';
import 'package:homework_34/data/models/auth/register_model.dart';

class AuthRepository {
  final ApiClient _client;

  AuthRepository({required ApiClient client}) : _client = client;

  Future<Result<String>> login(LoginModel loginModel) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        '/auth/login',
        data: loginModel.toJson(),
      );

      final data = response.data!;
    
      TokenStorage.saveToken(data['accessToken']);
      if (data.containsKey("accessToken")) {
        return Result.ok(data["accessToken"] as String);
      } else if (data.containsKey("token")) {
        return Result.ok(data["token"] as String);
      } else {
        return Result.error(Exception("Token topilmadi"));
      }
    } catch (e) {
      return Result.error(Exception("Login error: $e"));
    }
  }

  Future<Result<String>> register(RegisterModel user) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        '/auth/register',
        data: user.toJson(),
      );

      final data = response.data!;
      print("Register response: $data");

      if (data.containsKey("accessToken")) {
        return Result.ok(data["accessToken"] as String);
      } else if (data.containsKey("token")) {
        return Result.ok(data["token"] as String);
      } else {
        return Result.error(Exception("Token topilmadi"));
      }
    } catch (e) {
      return Result.error(Exception("Register error: $e"));
    }
  }
}
