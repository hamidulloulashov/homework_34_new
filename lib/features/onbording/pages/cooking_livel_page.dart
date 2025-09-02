import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/features/onbording/pages/cuisins_page.dart';
import 'package:homework_34/features/onbording/widgets/contanir_widget.dart';

class CookingLivel extends StatelessWidget {
  const CookingLivel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(arrow: 'assets/arrow.png',),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
            padding: const EdgeInsets.only(),
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
          ),
            Padding(
              padding: const EdgeInsets.only(right: 40,top: 10),
              child: Text(
                "¿What is your cooking level?",
                style: TextStyle(
                     color: Theme.of(context).colorScheme.inverseSurface,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 30),
             Padding(
              padding: EdgeInsets.only(right: 70, bottom: 30),
              child: Text(
                "Please select you cooking level for a\nbetter recommendations..",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 20), child: Contanir()),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cuisins()),
                );
              },
              child: Container(
                width: 162,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: AppColors.text,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 6, left: 38),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
