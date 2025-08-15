// import 'package:flutter/material.dart';
// import 'package:homework_34/core/client.dart';
// import 'package:homework_34/data/models/onbording_models/cusins_model.dart';

// class CusinsViewModel extends ChangeNotifier {
//   CusinsViewModel() {
//     fetchCategories();
//   }

//   List<CusinsModel> cusins = [];
//   bool isLoading = true;
//   String? error;

//   Future<void> fetchCategories() async {
//     try {
//       isLoading = true;
//       error = null;
//       notifyListeners();

//       var response = await dio.get('/cuisines/list');
//       if (response.statusCode == 200) {
//         cusins = (response.data as List)
//             .map((x) => CusinsModel.fromJson(x))
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
