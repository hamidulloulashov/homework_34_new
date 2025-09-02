import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/utils/result.dart';
import 'package:homework_34/data/models/trending/detail_model.dart';
import 'package:homework_34/data/models/trending/most_model.dart';

class MostRepository {
  final ApiClient apiClient;
  MostRepository({required this.apiClient});

  Future<Result<List<MostModel>>> getTrendingRecipes() async {
    final result = await apiClient.get<dynamic>('/recipes/trending-recipe');

    return result.fold(
      (error) => Result.error(error),
      (data) {
        if (data == null) {
          return Result.error(Exception("Bo'sh ma'lumot keldi"));
        }
        if (data is List) {

          final list = data
              .map((e) => MostModel.fromJson(Map<String, dynamic>.from(e)))
              .toList();
          return Result.ok(list);
        }
        if (data is Map<String, dynamic>) {
          final recipe = MostModel.fromJson(data);
          return Result.ok([recipe]);
        }
        return Result.error(Exception("Kutilmagan format: ${data.runtimeType}"));
      },
    );
  }
}


class AllRepository {
  final ApiClient apiClient;
  AllRepository({required this.apiClient});

  Future<Result<List<DetailModel>>> getRecipesList() async {
    final result = await apiClient.get<dynamic>('/recipes/list');
    return result.fold(
      (error) {
        return Result.error(error);
      },
      (data) {
        if (data is List) {
          final list = data
              .map((e) => DetailModel.fromJson(Map<String, dynamic>.from(e)))
              .toList();
          return Result.ok(list);
        }
        return Result.error(Exception("Kutilmagan format: ${data.runtimeType}"));
      },
    );
  }
}

class DetailRepository {
  final ApiClient apiClient;
  DetailRepository({required this.apiClient});

  Future<Result<DetailModel>> fetchRecipeById(int id) async {
    final result = await apiClient.get<dynamic>('/recipes/$id');
    return result.fold(
      (error) => Result.error(error),
      (data) {
        if (data is Map<String, dynamic>) {
          return Result.ok(DetailModel.fromJson(data));
        }
        if (data is List && data.isNotEmpty) {
          return Result.ok(DetailModel.fromJson(Map<String, dynamic>.from(data.first)));
        }
        return Result.error(Exception("Kutilmagan format yoki bosh data"));
      },
    );
  }
}
