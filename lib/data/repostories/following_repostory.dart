import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/utils/result.dart';
import 'package:homework_34/data/models/following/following_model.dart';

class FollowingRepostory {
  final ApiClient apiClient;

  FollowingRepostory({ApiClient? apiClient})
      : apiClient = apiClient ?? ApiClient();

  Future<Result<List<FollowingModel>>> fetchCategories() async {
    final Result<List<dynamic>> result = await apiClient.get<List<dynamic>>('/auth/followings/1');
    return result.fold(
      (err) => Result.error(err),
      (data) {
        try {
          final following = data
              .map((x) => FollowingModel.fromJson(Map<String, dynamic>.from(x)))
              .toList();
          return Result.ok(following);
        } catch (e) {
          return Result.error(Exception("Parsing error: $e"));
        }
      },
    );
  }
}
class FollowersRepository {
  final ApiClient apiClient;

  FollowersRepository({ApiClient? apiClient})
      : apiClient = apiClient ?? ApiClient();

  Future<Result<List<FollowingModel>>> fetchFollowers(int userId) async {
    final Result<List<dynamic>> result =
        await apiClient.get<List<dynamic>>('/auth/followers/$userId');

    return result.fold(
      (err) => Result.error(err),
      (data) {
        try {
          final followers = data
              .map((x) => FollowingModel.fromJson(Map<String, dynamic>.from(x)))
              .toList();
          return Result.ok(followers);
        } catch (e) {
          return Result.error(Exception("Parsing error: $e"));
        }
      },
    );
  }
}