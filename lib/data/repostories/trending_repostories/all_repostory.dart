import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/trending_repostories_models/all_model.dart';

class AllRepository {
  Future<Result<List<AllModel>>> getRecipesList() async {
    try {
      final response = await DioClient.get('/recipes/list');

      if (response.statusCode != 200) {
        return Result.error(Exception("Server xatosi: ${response.statusCode}"));
      }

      final data = response.data;

      if (data == null) {
        return Result.error(Exception("Bosh malumot keldi"));
      }

      if (data is List) {
        final list = data
            .map((e) => AllModel.fromJson(Map<String, dynamic>.from(e ?? {})))
            .toList();
        return Result.ok(list);
      } else if (data is Map<String, dynamic>) {
        final recipe = AllModel.fromJson(Map<String, dynamic>.from(data));
        return Result.ok([recipe]);
      } else {
        return Result.error(
          Exception("Kutilmagan format: ${data.runtimeType}"),
        );
      }
    } catch (e) {
      return Result.error(Exception("Network xatosi: $e"));
    }
  }
}
