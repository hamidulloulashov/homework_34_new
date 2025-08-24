import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/colors.dart';

class SucsefullWidget extends StatelessWidget {
  const SucsefullWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 286,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Text(
            "Sign up\nsuccesful!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(41),
              color: AppColors.container,
            ),
            child: Image.asset("assets/person.png"),
          ),
          Text(
            "Lorem ipsum dolor sit\namet pretium cras id dui\npellentesque ornare.\nQuisque malesuada.",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
