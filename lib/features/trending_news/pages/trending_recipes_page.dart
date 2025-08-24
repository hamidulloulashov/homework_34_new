import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import 'package:homework_34/data/repostories/trending_repostory.dart';
import 'package:homework_34/features/top_chef/widgets/most_widget.dart';
import 'package:homework_34/features/trending_news/managers/all_view_model.dart';
import 'package:homework_34/features/trending_news/managers/most_view_model.dart';
import 'package:homework_34/features/trending_news/widgets/all_widget.dart';
import 'package:homework_34/features/trending_news/widgets/bottom_navigator_widget.dart';
import 'package:provider/provider.dart';

class TrendingRecipesPage extends StatelessWidget {
  const TrendingRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient(); 
    final mostRepository = MostRepository(apiClient: apiClient);
    final allRepository = AllRepository(apiClient: apiClient); 
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MostViewModel(repository: mostRepository)..fetchMenu(), 
        ),
        ChangeNotifierProvider(
          create: (_) => AllViewModel(
            repository: allRepository, 
          )..fetchMenu(),
        ),
      ],
      child: Scaffold(
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
              const SizedBox(width: 50),
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
              const SizedBox(width: 8),
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
            children: const [
              MostWidget(),
              SizedBox(height: 20),
              AllWidget(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigatorNews(),
      ),
    );
  }
}


