import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';

class Contanir extends StatelessWidget {
  const Contanir({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 356,
          height: 116,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primary,
            border: Border.all(color: AppColors.white, width: 1),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 250),
                child: Text(
                  "Novice",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Lorem ipsum dolor sit amet consectetur. Auctor\npretium cras id dui pellentesque ornare. Quisque\nmalesuada netus pulvinar diam.",
                style: TextStyle(color: AppColors.white),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 356,
          height: 116,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primary,
            border: Border.all(color: AppColors.white, width: 1),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 190),
                child: Text(
                  "Intermediate",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Lorem ipsum dolor sit amet consectetur. Auctor\npretium cras id dui pellentesque ornare. Quisque\npulvinar diam.",
                style: TextStyle(color: AppColors.white),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 356,
          height: 116,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primary,
            border: Border.all(color: AppColors.text, width: 1),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 210),
                child: Text(
                  "Advanced",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Lorem ipsum dolor sit amet pretium cras id dui\npellentesque ornare. Quisque malesuada netus\npulvinar diam.",
                style: TextStyle(color: AppColors.white),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 356,
          height: 116,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primary,
            border: Border.all(color: AppColors.white, width: 1),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 190),
                child: Text(
                  "Professional",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Lorem ipsum dolor sit amet consectetur. Auctor\npretium cras id dui pellentesque ornare. Quisque\nmalesuada.",
                style: TextStyle(color: AppColors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
