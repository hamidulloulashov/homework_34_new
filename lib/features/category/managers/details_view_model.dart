// import 'package:flutter/material.dart';
// import 'package:homework_34/core/client.dart';
// import 'package:homework_34/data/models/category_models/detail_model.dart';

// class DetailsViewModel extends ChangeNotifier {
//   List<RecipeModel> recipes = [];
//   bool isLoading = false;
//   String? error;
//   Future<void> fetchRecipes(int categoryId) async {
//     try {
//       isLoading = true;
//       error = null;
//       recipes = [];
//       notifyListeners();

//       final response = await dio.get('/recipes/list');

//       if (response.statusCode == 200) {
//         final data = response.data as List;
//         recipes = data
//             .map((x) => RecipeModel.fromJson(Map<String, dynamic>.from(x)))
//             .where((recipe) => recipe.categoryId == categoryId)
//             .toList();
//       } else {
//         error = "Xato status: ${response.statusCode}";
//       }
//     } catch (e, s) {
//       error = e.toString();
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }
