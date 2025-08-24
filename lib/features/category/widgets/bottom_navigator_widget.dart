import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/colors.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.text,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/home.png", width: 26, height: 22),
          Image.asset("assets/message.png", width: 26, height: 22),
          Image.asset("assets/box.png", width: 26, height: 22),
          Image.asset("assets/profile.png", width: 26, height: 22),
        ],
      ),
    );
  }
}
