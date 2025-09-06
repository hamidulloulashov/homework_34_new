import 'package:homework_34/core/utils/result.dart';
import '../../core/client.dart';
import '../models/home/models/home_page_model/chefs_models.dart';
import '../models/home/models/home_page_model/recepi_models.dart';
import '../models/home/models/home_page_model/resently_models.dart';
import '../models/home/models/home_page_model/trending_models.dart';

class Repository {
  final ApiClient apiClient;
  Repository({required this.apiClient});
  Future<Result<List<ChefsModels>>> getTopChefs() async {
    final result = await apiClient.get<List>("/auth/top-chefs");
    return result.fold(
      (error) => Result.error(error),
      (data) {
        try {
          return Result.ok(
            (data as List).map((e) => ChefsModels.fromJson(e)).toList(),
          );
        } catch (e) {
          return Result.error(Exception("Parsing error (Chefs): $e"));
        }
      },
    );
  }
  // Future<Result<List<MenyuModels>>> getCategories() async {
  //   final result = await apiClient.get<List>("admin/categories/list");
  //   return result.fold(
  //     (error) => Result.error(error),
  //     (data) {
  //       try {
  //         return Result.ok(
  //           (data as List).map((e) => MenyuModels.fromJson(e)).toList(),
  //         );
  //       } catch (e) {
  //         return Result.error(Exception("Parsing error (Menyu): $e"));
  //       }
  //     },
  //   );
  // }
  Future<Result<List<ResentlyModels>>> getRecently() async {
    final result = await apiClient.get<List>("/recipes/list?Page=2&Limit=2");
    return result.fold(
      (error) => Result.error(error),
      (data) {
        try {
          return Result.ok(
            (data as List).map((e) => ResentlyModels.fromJson(e)).toList(),
          );
        } catch (e) {
          return Result.error(Exception("Parsing error (Recently): $e"));
        }
      },
    );
  }
  Future<Result<List<RecepiModels>>> getRecipes() async {
    final result = await apiClient.get<List>("/recipes/list?Limit=2");
    return result.fold(
      (error) => Result.error(error),
      (data) {
        try {
          return Result.ok(
            (data as List).map((e) => RecepiModels.fromJson(e)).toList(),
          );
        } catch (e) {
          return Result.error(Exception("Parsing error (Recipes): $e"));
        }
      },
    );
  }
  Future<Result<List<TrendingModels>>> getTrending() async {
    final result = await apiClient.get("/recipes/trending-recipe");
    return result.fold(
      (error) => Result.error(error),
      (data) {
        try {
          if (data is List) {
            return Result.ok(
              data.map((e) => TrendingModels.fromJson(Map<String, dynamic>.from(e))).toList(),
            );
          } else if (data is Map) {
            return Result.ok(
              [TrendingModels.fromJson(Map<String, dynamic>.from(data))],
            );
          } else {
            return Result.error(Exception("Invalid data format for Trending"));
          }
        } catch (e) {
          return Result.error(Exception("Parsing error (Trending): $e"));
        }
      },
    );
  }
}
