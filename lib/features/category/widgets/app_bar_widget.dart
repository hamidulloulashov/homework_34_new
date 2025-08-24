import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/arrow.png", width: 22, height: 14),
        SizedBox(width: 80),
        Text(
          "Your Recipes",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: AppColors.text,
          ),
        ),
        SizedBox(width: 50),
        Image.asset("assets/notifaction.png", width: 28, height: 28),
        SizedBox(width: 8),
        Image.asset("assets/search.png", width: 28, height: 28),
      ],
    );
  }
}
