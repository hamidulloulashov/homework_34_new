// import 'package:flutter/material.dart';
// import 'package:homework_34/core/client.dart';
// import 'package:homework_34/data/models/onbording_models/first_page_model.dart';

// class FristViewModels extends ChangeNotifier {
//   FristViewModels() {
//     fetchCategories();
//   }

//   List<FirstPageModel> frist = [];
//   bool isLoading = true;
//   String? error;

//   Future<void> fetchCategories() async {
//     try {
//       isLoading = true;
//       error = null;
//       notifyListeners();

//       var response = await dio.get('/onboarding/list');
//       if (response.statusCode == 200) {
//         frist = (response.data as List)
//             .map((x) => FirstPageModel.fromJson(x))
//             .toList();
//       } else {
//         error = "Xato statuslar: ${response.statusCode}";
//       }
//     } catch (e) {
//       error = e.toString();
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }
