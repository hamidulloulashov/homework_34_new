import 'package:dio/dio.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/auth_models/login_model.dart';

class LoginRepository {
  Future<Result<String>> login(LoginModel loginModel) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: loginModel.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic>) {
          if (response.data.containsKey('token')) {
            return Result.ok(response.data['token']);
          } else if (response.data.containsKey('accessToken')) {
            return Result.ok(response.data['accessToken']);
          } else {
            return Result.error(Exception('Token topilmadi'));
          }
        } else {
          return Result.error(Exception('Response data not a map'));
        }
      } else {
        return Result.error(
          Exception('Server xatolik: ${response.statusCode}'),
        );
      }
    } catch (e) {
      return Result.error(Exception('Login error: $e'));
    }
  }
}
