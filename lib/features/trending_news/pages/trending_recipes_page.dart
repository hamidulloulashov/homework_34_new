import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/data/repostories/trending_repostory.dart';
import 'package:homework_34/features/trending_news/managers/detail_veiw_model.dart';
import 'package:homework_34/features/trending_news/managers/most_view_model.dart';
import 'package:homework_34/features/trending_news/widgets/all_widget.dart';
import 'package:homework_34/features/common/widgets/bottom_navigator_widget.dart';
import 'package:homework_34/features/trending_news/widgets/most_widget.dart';
import 'package:provider/provider.dart';

class TrendingRecipesPage extends StatefulWidget {
  const TrendingRecipesPage({super.key});

  @override
  State<TrendingRecipesPage> createState() => _TrendingRecipesPageState();
}

class _TrendingRecipesPageState extends State<TrendingRecipesPage> {
  late MostViewModel mostViewModel;
  late DetailViewModel detailViewModel;
  
  @override
  void initState() {
    super.initState();
    final apiClient = ApiClient();

    mostViewModel = MostViewModel(
      repository: MostRepository(apiClient: apiClient),
    );
    
    detailViewModel = DetailViewModel(
      allRepository: AllRepository(apiClient: apiClient),
      detailRepository: DetailRepository(apiClient: apiClient),
    );
  
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostViewModel.fetchMenu();
      detailViewModel.fetchAllRecipes();
    });
  }

  @override
  void dispose() {
    mostViewModel.dispose();
    detailViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MostViewModel>.value(value: mostViewModel),
        ChangeNotifierProvider<DetailViewModel>.value(value: detailViewModel),
      ],
      child: Scaffold(
        extendBody: true,
        appBar: const CustomAppBar(
          title: "Trending Recipes",
          arrow: 'assets/arrow.png',
        ),
        body: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
            
              MostWidget(),  
              SizedBox(height: 20),
              AllWidget(),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigatorNews(),
      ),
    );
  }
}

