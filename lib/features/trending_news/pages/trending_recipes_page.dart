import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/widgets/custom_appbar_widget.dart';
import 'package:homework_34/data/repostories/trending_repostory.dart';
import 'package:homework_34/features/top_chef/widgets/most_widget.dart';
import 'package:homework_34/features/trending_news/managers/all_view_model.dart';
import 'package:homework_34/features/trending_news/managers/most_view_model.dart';
import 'package:homework_34/features/trending_news/widgets/all_widget.dart';
import 'package:homework_34/core/widgets/bottom_navigator_widget.dart';
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
        extendBody: true,
        appBar: CustomAppBar(title: "Trending Recipeis", arrow: 'assets/arrow.png',),
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


