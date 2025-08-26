import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/trending_repostories_models/all_model.dart';
import 'package:homework_34/data/models/trending_repostories_models/detail_model.dart';
import 'package:homework_34/data/models/trending_repostories_models/mosts_.dart';

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

  Future<Result<List<AllModel>>> getRecipesList() async {
    final result = await apiClient.get<List<dynamic>>('/recipes/list');
    return result.fold(
      (error) {
        print('❌ API Error in getRecipesList: $error');
        return Result.error(error);
      },
      (data) {
        final list = data
            .map((e) => AllModel.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        return Result.ok(list);
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
          final recipe = DetailModel.fromJson(data);
          return Result.ok(recipe);
        } else if (data is List && data.isNotEmpty && data.first is Map<String, dynamic>) {
          final recipe = DetailModel.fromJson(data.first);
          return Result.ok(recipe);
        } else {
          return Result.error(Exception("Kutilmagan format yoki bosh data"));
        }
      },
    );
  }
}