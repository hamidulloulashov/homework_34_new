// import 'package:flutter/material.dart';
// import 'package:homework_34/core/client.dart';
// import 'package:homework_34/data/models/onbording_models/second_page_models.dart';

// class SecondViewModels extends ChangeNotifier {
//   SecondViewModels() {
//     fetchCategories();
//   }
//   List<SecondPageModels> second = [];
//   bool isLoading = true;
//   String? error;
//   Future<void> fetchCategories() async {
//     try {
//       isLoading = true;
//       error = null;
//       notifyListeners();

//       var response = await dio.get('/onboarding/list');
//       if (response.statusCode == 200) {
//         second = (response.data as List)
//             .map((x) => SecondPageModels.fromJson(x))
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
