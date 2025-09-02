import 'package:homework_34/data/models/profile/profile_model.dart';
import 'package:homework_34/data/models/recipe/recipies_model.dart';
import 'package:homework_34/data/models/top_chefs/top_chef_model.dart';
import '../../core/client.dart';
import '../../core/utils/result.dart';
class TopChefsRepostory {
  final ApiClient apiClient;
  TopChefsRepostory({required this.apiClient});

  Future<Result<List<TopChefModel>>> fetchChefs() async {
    final result = await apiClient.get("/auth/top-chefs");

    return result.fold((error) => Result.error(error), (data) {
      final list = (data as List).map((e) => TopChefModel.fromJson(e)).toList();
      return Result.ok(list);
    });
  }

  Future<Result<List<ProfileModel>>> fetchChefsId(int id) async {
    final result = await apiClient.get("/auth/details/$id");

    return result.fold((error) => Result.error(error), (data) {
      final model = ProfileModel.fromJson(data);
      return Result.ok([model]);
    });
  }

  Future<Result<List<RecipeModel>>> fetchRecipes(String id) async {
    final result = await apiClient.get("/recipes/list?UserId=$id");

    return result.fold((error) => Result.error(error), (data) {
      final list = (data as List).map((e) => RecipeModel.fromJson(e)).toList();
      return Result.ok(list);
    });
  }
}
