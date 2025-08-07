import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/data/models/onbording_models/allergic_model.dart';

class AllergicVewModel extends ChangeNotifier {
  AllergicVewModel() {
    fetchCategories();
  }

  List<AllergicModel> allergic = [];
  bool isLoading = true;
  String? error;

  Future<void> fetchCategories() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      var response = await dio.get('/allergic/list');
      if (response.statusCode == 200) {
        allergic = (response.data as List)
            .map((x) => AllergicModel.fromJson(x))
            .toList();
      } else {
        error = "Xato statuslar: ${response.statusCode}";
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
