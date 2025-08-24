import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/auth_models/login_model.dart';
import 'package:homework_34/data/models/auth_models/register_model.dart';

class AuthRepository {
  final ApiClient _client;

  AuthRepository({required ApiClient client}) : _client = client;
  Future<Result<String>> login(LoginModel loginModel) async {
    try {
      final result = await _client.post<String>(
        '/auth/login',
        data: loginModel.toJson(),
      );

      return result.fold(
        (error) => Result.error(error),
        (value) => Result.ok(value),
      );
    } catch (e) {
      return Result.error(Exception('Login error: $e'));
    }
  }
 Future<Result<String>> register(RegisterModel user) async {
  try {
    print("UserData: ${user.toJson()}");

    final result = await _client.post<Map<String, dynamic>>(
      '/auth/register',
      data: user.toJson(),
    );
    return result.fold(
      (error) {
  
        print("Repositoryda xatolik: $error");
        return Result.error(error);
      },
      (data) {
        if (data.containsKey("accessToken")) {
          return Result.ok(data["accessToken"] as String);
        } else {
          return Result.error(Exception("accessToken topilmadi"));
        }
      },
    );
  } catch (e) {

    return Result.error(Exception('Register error: $e'));
  }
}

}
