import 'package:homework_34/core/client.dart';
import 'package:homework_34/data/models/community/community_model.dart';
class CommunityRepository {
  final ApiClient _apiClient;

  CommunityRepository(this._apiClient);

  Future<List<CommunityModel>> getCommunity() async {
    final result = await _apiClient.get<List<dynamic>>('/recipes/community/list');

    return result.fold(
          (error) => throw Exception(error.toString()),
          (value) {
        return (value)
            .map((json) => CommunityModel.fromJson(json))
            .toList();
      },
    );
  }
}


