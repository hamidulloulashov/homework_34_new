import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/trending_repostories_models/most_model.dart';

class MostRepository {
  Future<Result<List<MostModel>>> getTrendingRecipes() async {
    try {
      final response = await DioClient.get('/recipes/trending-recipe');

      if (response.statusCode == 200) {
        if (response.data is List) {
          final list = (response.data as List)
              .map((e) => MostModel.fromJson(Map<String, dynamic>.from(e)))
              .toList();
          return Result.ok(list);
        } else if (response.data is Map) {
          final recipe = MostModel.fromJson(
            Map<String, dynamic>.from(response.data),
          );
          return Result.ok([recipe]);
        } else {
          return Result.error(Exception("Kutilmagan format"));
        }
      } else {
        return Result.error(
          Exception(
            "Server xatosi: ${response.statusCode} — ${response.statusMessage}",
          ),
        );
      }
    } catch (e) {
      return Result.error(Exception("Network xatosi: $e"));
    }
  }
}
