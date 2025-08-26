import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/category_models/category_model.dart';
import 'package:homework_34/data/models/category_models/detail_model.dart';

class CategoryRepository {
  final ApiClient apiClient;

  CategoryRepository({ApiClient? apiClient})
      : apiClient = apiClient ?? ApiClient();

  Future<Result<List<CategoryModel>>> fetchCategories() async {
    final Result<List<dynamic>> result = await apiClient.get<List<dynamic>>('/categories/list');

    return result.fold(
      (err) => Result.error(err),
      (data) {
        try {
          final categories = data
              .map((x) => CategoryModel.fromJson(Map<String, dynamic>.from(x)))
              .toList();
          return Result.ok(categories);
        } catch (e) {
          return Result.error(Exception("Parsing error: $e"));
        }
      },
    );
  }
}


class DetailsRepository {
  final ApiClient apiClient;

  DetailsRepository({ApiClient? apiClient})
      : apiClient = apiClient ?? ApiClient();

  Future<Result<List<RecipeModel>>> fetchRecipes(int categoryId) async {
    final Result<List<dynamic>> result = await apiClient.get<List<dynamic>>('/recipes/list');

    return result.fold(
      (err) => Result.error(err),
      (data) {
        try {
          final recipes = data
              .map((x) => RecipeModel.fromJson(Map<String, dynamic>.from(x)))
              .where((recipe) => recipe.categoryId == categoryId)
              .toList();
          return Result.ok(recipes);
        } catch (e) {
          return Result.error(Exception("Parsing error: $e"));
        }
      },
    );
  }
}
