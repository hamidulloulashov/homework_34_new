import 'package:flutter/material.dart';
import 'package:homework_34/data/models/trending/most_model.dart';
import 'package:homework_34/data/repostories/trending_repostory.dart';

class MostViewModel extends ChangeNotifier {
  final MostRepository repository;

  bool isLoading = false;
  String? error;
  List<MostModel> menus = [];

  MostViewModel({required this.repository});

  Future<void> fetchMenu() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final result = await repository.getTrendingRecipes();

      
      result.fold(
        (err) {
          error = "Server bilan bog'lanishda xatolik: ${err.toString()}";
          menus = [];
        },
        (data) {
          if (data.isEmpty) {
            error = "Trending recipes mavjud emas";
            menus = [];
          } else {
            
            menus = data;
            print('---------------------');
            print(menus);
            print('---------------------');
            error = null;
          }
        },
      );
    } catch (e) {
      error = "Kutilmagan xatolik: $e";
      menus = [];
    }

    isLoading = false;
    notifyListeners();
  }
}