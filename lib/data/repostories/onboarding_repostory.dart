import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/result/result.dart';
import 'package:homework_34/data/models/onbording_models/allergic_model.dart';
import 'package:homework_34/data/models/onbording_models/cusins_model.dart';
import 'package:homework_34/data/models/onbording_models/first_page_model.dart';
import 'package:homework_34/data/models/onbording_models/second_page_model.dart';

class OnboardingRepository {
  final ApiClient apiClient;

  OnboardingRepository({required this.apiClient});

  Future<Result<List<AllergicModel>>> getAllergic() async {
    try {
      final response = await apiClient.get('/categories/list');

      final data = (response.data as List)
          .map((x) => AllergicModel.fromJson(x))
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

  Future<Result<List<FirstPageModel>>> getFirstPage() async {
    try {
      final response = await apiClient.get('/onboarding/list');

      final data = (response.data as List)
          .map((x) => FirstPageModel.fromJson(x))
          .toList();
      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  Future<Result<List<SecondPageModels>>> getSecondPage() async {
    try {
      final response = await apiClient.get('/onboarding/list');

      final data = (response.data as List)
          .map((x) => SecondPageModels.fromJson(x))
          .toList();
      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
