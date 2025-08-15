import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/app_theme.dart';
import 'package:homework_34/data/repostories/trending_repostories/all_repostory.dart';
import 'package:homework_34/data/repostories/trending_repostories/most_repostory.dart';
import 'package:homework_34/features/trending_news/managers/most_view_model.dart';
import 'package:homework_34/features/trending_news/managers/all_view_model.dart';
import 'package:homework_34/features/trending_news/widgets/all_widget.dart';
import 'package:homework_34/features/trending_news/widgets/bottom_navigator.dart';
import 'package:homework_34/features/trending_news/widgets/most_widget.dart';
import 'package:provider/provider.dart';

class TrendingRecipesPage extends StatelessWidget {
  const TrendingRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Trending Recipes",
              style: TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 50),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.container,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Image.asset(
                  "assets/notifaction.png",
                  width: 25,
                  height: 25,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(width: 8),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.container,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Image.asset("assets/search.png", width: 25, height: 30),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ChangeNotifierProvider(
              create: (_) => MostViewModel(MostRepository())..fetchMenu(),
              child: MostWidget(),
            ),
            SizedBox(height: 20),
            ChangeNotifierProvider(
              create: (_) => AllViewModel(AllRepository())..fetchMenu(),
              child: AllWidget(),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigatorNews(),
    );
  }
}
