import 'package:dio/dio.dart';
import 'result/result.dart';
class ApiClient {
  final _dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.0.101:8888/api/v1",
      connectTimeout: const Duration(seconds: 10), 
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
  Future<Result<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParams);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Result.ok(response.data as T);
      } else {
        return Result.error(Exception("Server error: ${response.statusCode}"));
      }
    } on DioException catch (dioError) {
      String errorMessage;
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          errorMessage = 'Server bilan bog\'lanish vaqti tugadi';
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Server javob berishda sekin';
          break;
        case DioExceptionType.connectionError:
          errorMessage = 'Internet aloqasini tekshiring';
          break;
        case DioExceptionType.badResponse:
          errorMessage = 'Server xatosi: ${dioError.response?.statusCode}';
          break;
        default:
          errorMessage = 'Tarmoq xatosi: ${dioError.message}';
      }
      return Result.error(Exception(errorMessage));
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  Future<Result<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParams,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Result.ok(response.data as T);
      } else {
        return Result.error(Exception("Server error: ${response.statusCode}"));
      }
    } on DioException catch (dioError) {
      String errorMessage;
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          errorMessage = 'Server bilan bog\'lanish vaqti tugadi';
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Server javob berishda sekin';
          break;
        case DioExceptionType.connectionError:
          errorMessage = 'Internet aloqasini tekshiring';
          break;
        case DioExceptionType.badResponse:
          errorMessage = 'Server xatosi: ${dioError.response?.statusCode}';
          break;
        default:
          errorMessage = 'Tarmoq xatosi: ${dioError.message}';
      }
      return Result.error(Exception(errorMessage));
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
