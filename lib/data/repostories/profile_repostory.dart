import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/utils/result.dart';
import 'package:homework_34/data/models/profile/profile_model.dart';
class ProfileRepostory {
  final ApiClient apiClient;
  ProfileRepostory({required this.apiClient});
  Future<Result<ProfileModel>> fetchProfile() async {
    final result = await apiClient.get("/auth/me");
    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(ProfileModel.fromJson(data)),
    );
  }
}
