import 'package:dio/dio.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/data/models/auth_models/login_model.dart';

class LoginRepository {
  Future<String?> login(LoginModel loginModel) async {
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
            return response.data['token'];
          } else if (response.data.containsKey('accessToken')) {
            return response.data['accessToken'];
          } else {
            print('Token topilmadi, response data: ${response.data}');
            return null;
          }
        }
      }
      return null;
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }
}
