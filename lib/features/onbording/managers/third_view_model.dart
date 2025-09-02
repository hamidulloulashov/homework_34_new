import 'package:flutter/material.dart';
import 'package:homework_34/data/models/onboarding/third_model.dart';

class ThirdViewModel extends ChangeNotifier {
  List<ThirdModel> third = [];

  ThirdViewModel() {
    getData();
  }

  void getData() {
    third = [
      ThirdModel(image: "assets/image1.png"),

      ThirdModel(image: "assets/image2.png"),

      ThirdModel(image: "assets/image3.png"),

      ThirdModel(image: "assets/image4.png"),

      ThirdModel(image: "assets/image5.png"),

      ThirdModel(image: "assets/image6.png"),
    ];
    notifyListeners();
  }
}
