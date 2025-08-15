// import 'dart:developer';

// import 'package:homework_34/core/client.dart';
// import 'package:homework_34/core/result/result.dart';
// import 'package:homework_34/data/models/auth_models/login_model.dart';
// import 'package:homework_34/data/models/auth_models/register_models.dart';

// class AuthRepository {
//   final ApiClient _client;

//   AuthRepository({required ApiClient client}) : _client = client;

//   Future<Result<String>> login(LoginModel loginModel) async {
//     try {
//       final result = await _client.post<String>(
//         '/auth/login',
//         data: loginModel.toJson(),
//       );

//       return result.fold(
//         (error) => Result.error(error),
//         (value) => Result.ok(value),
//       );
//     } catch (e) {
//       return Result.error(Exception('Login error: $e'));
//     }
//   }

//   Future<Result<String>> register(RegisterModel user) async {
//     try {
//       print("UserData: $user");
//       final result = await _client.post('/auth/register', data: user.toJson());

//       return result.fold(
//         (error) {
//           log("Repositoryda xatolik: $error");

//           return Result.error(error);
//         },
//         (value) {
//           print("Ok ishladi: $value");
//           return Result.ok(value["accessToken"]);
//         },
//       );
//     } catch (e) {
//       return Result.error(Exception('Register error: $e'));
//     }
//   }
// }
