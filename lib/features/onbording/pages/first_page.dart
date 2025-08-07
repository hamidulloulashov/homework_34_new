import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/app_theme.dart';
import 'package:homework_34/features/onbording/managers/frist_view_models.dart';
import 'package:homework_34/features/onbording/pages/second_page.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FristViewModels(),
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.primary,
        body: Consumer<FristViewModels>(
          builder: (context, vm, child) {
            if (vm.frist.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.network(vm.frist[0].image, fit: BoxFit.cover),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary.withOpacity(1),
                          Colors.transparent,
                          AppColors.primary.withOpacity(1),
                        ],
                        stops: const [0.2, 0.4, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Get inspired",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Get inspired with our daily recipe recommendations.",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondPage()),
                        );
                      },

                      child: Container(
                        width: 162,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: AppColors.container,
                        ),
                        child: const Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              color: AppColors.icons,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
