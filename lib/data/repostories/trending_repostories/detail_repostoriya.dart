import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/trending_repostories_models/detail_model.dart';

class DetailRepository {
  Future<Result<DetailModel>> fetchRecipeById(int id) async {
    try {
      final response = await DioClient.get('/recipes/$id');

      if (response.statusCode != 200) {
        return Result.error(Exception("Server xatosi: ${response.statusCode}"));
      }

      final data = response.data;

      if (data == null) {
        return Result.error(Exception("Bo‘sh ma’lumot keldi"));
      }

      if (data is Map<String, dynamic>) {
        final recipe = DetailModel.fromJson(data);
        return Result.ok(recipe);
      }

      if (data is List && data.isNotEmpty) {
        final firstItem = data.first;
        if (firstItem is Map<String, dynamic>) {
          final recipe = DetailModel.fromJson(firstItem);
          return Result.ok(recipe);
        }
      }

      return Result.error(Exception("Kutilmagan format yoki bo‘sh data"));
    } catch (e) {
      return Result.error(Exception("Network xatosi: $e"));
    }
  }
}
