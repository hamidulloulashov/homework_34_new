import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/utils/result.dart';
import 'package:homework_34/data/models/your_recipies/your_recipeis_model.dart';

class YourRecipiesRepostory {
  final ApiClient apiClient;
  YourRecipiesRepostory({required this.apiClient});

  Future<Result<List<YourRecipeisModel>>> fetchAllRecipes() async {
    final result = await apiClient.get<dynamic>('/recipes/list');
    return result.fold(
      (error) => Result.error(error),
      (data) {
        if (data is List) {
          final recipes = data
              .map((e) => YourRecipeisModel.fromJson(e as Map<String, dynamic>))
              .toList(); 
          return Result.ok(recipes);
        } else {
          return Result.error(Exception("Kutilmagan format"));
        }
      },
    );
  }
}
