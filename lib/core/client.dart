// import 'package:dio/dio.dart';
// import 'package:homework_34/core/result/result.dart';

// class ApiClient {
//   final _dio = Dio(
//     BaseOptions(
//       baseUrl: "http://192.168.11.61:8888/api/v1",
//       validateStatus: (status) => true,
//       connectTimeout: const Duration(seconds: 3),
//       receiveTimeout: const Duration(seconds: 5),
//     ),
//   );
//   Future<Result<T>> get<T>(
//     String path, {
//     Map<String, dynamic>? queryParams,
//   }) async {
//     try {
//       var response = await _dio.get(path, queryParameters: queryParams);
//       if (response.statusCode != 200) {
//         return Result.error(Exception(response.data));
//       }
//       return Result.ok(response.data as T);
//     } on Exception catch (exception) {
//       return Result.error(exception);
//     }
//   }

//   Future<Result<T>> post<T>(
//     String path, {
//     required Map<String, dynamic> data,
//   }) async {
//     try {
//       var response = await _dio.post(path, data: data);
//       if (response.statusCode! <= 200 && response.statusCode! > 300) {
//         return Result.error(Exception(response.data));
//       }
//       print("Ifdan o'tdi");
//       return Result.ok(response.data);
//     } on Exception catch (e) {
//       return Result.error(e);
//     }
//   }

//   Future<Result<T>> patch<T>(
//     String path, {
//     required Map<String, dynamic> data,
//   }) async {
//     try {
//       var response = await _dio.patch(path, data: data);
//       if (response.statusCode != 200) {
//         return Result.error(response.data);
//       }
//       return Result.ok(response.data as T);
//     } on Exception catch (e) {
//       return Result.error(e);
//     }
//   }

//   Future<Result> delete(String path) async {
//     try {
//       var response = await _dio.delete(path);
//       if (response.statusCode != 204) {
//         return Result.error(response.data);
//       }
//       return Result.ok(response.data);
//     } on Exception catch (e) {
//       return Result.error(e);
//     }
//   }
// }import 'package:dio/dio.dart';

import 'package:dio/dio.dart';

class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.11.61:8888/api/v1/',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    ),
  );

  static Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  static Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }
}
