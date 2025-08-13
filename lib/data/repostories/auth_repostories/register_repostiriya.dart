import 'package:dio/dio.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/auth_models/register_models.dart';
import 'package:homework_34/core/client.dart';

class RegisterRepository {
  Future<Result<bool>> register(RegisterModel user) async {
    try {
      final response = await dio.post(
        '/auth/register',
        data: user.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Result.ok(true);
      } else {
        return Result.error(
          Exception('Server xatolik: ${response.statusCode}'),
        );
      }
    } catch (e) {
      return Result.error(Exception('Register error: $e'));
    }
  }
}
