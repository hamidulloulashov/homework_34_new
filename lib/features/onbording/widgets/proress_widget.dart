import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';

class ProgressBarWidget extends StatelessWidget {
  final int currentStep; 
  
  const ProgressBarWidget({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    double getLeftPosition() {
      switch (currentStep) {
        case 1:
          return 0; 
        case 2:
          return 82.5;
        case 3:
          return 165; 
        default:
          return 0;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 80, top: 10, bottom: 10),
      child: Stack(
        children: [
     
          Container(
            width: 230,
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
          ),
  
          Positioned(
            left: getLeftPosition(),
            child: Container(
              width: 65,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}