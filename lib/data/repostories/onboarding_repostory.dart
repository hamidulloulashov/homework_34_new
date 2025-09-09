import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/utils/result.dart';
import 'package:homework_34/data/models/onboarding/cusins_model.dart';
import 'package:homework_34/data/models/onboarding/start_model.dart';
class OnboardingRepository {
  final ApiClient apiClient;

  OnboardingRepository({required this.apiClient});

  Future<Result<List<CusinsModel>>> getAllergic() async {
    try {
      final response = await apiClient.get('/allergic/list');

      final data = (response.data as List)
          .map((x) => CusinsModel.fromJson(x))
          .toList();
      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  Future<Result<List<CusinsModel>>> getCusins() async {
    try {
      final response = await apiClient.get('/cuisines/list');

      final data = (response.data as List)
          .map((x) => CusinsModel.fromJson(x))
          .toList();
      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  Future<Result<List<StartModel>>> getFirstPage() async {
    try {
      final response = await apiClient.get('/onboarding/list');

      final data = (response.data as List)
          .map((x) => StartModel.fromJson(x))
          .toList();
      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  Future<Result<List<StartModel>>> getSecondPage() async {
    try {
      final response = await apiClient.get('/onboarding/list');

      final data = (response.data as List)
          .map((x) => StartModel.fromJson(x))
          .toList();
      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
