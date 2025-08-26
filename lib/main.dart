import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/router/router.dart';
import 'package:homework_34/core/utils/theme/app_them.dart';
import 'package:homework_34/core/utils/theme/theme_view_model.dart';
import 'package:homework_34/data/repostories/onboarding_repostory.dart';
import 'package:homework_34/data/repostories/trending_repostory.dart';
import 'package:homework_34/data/repostories/top_chefs_repostory.dart';
import 'package:homework_34/data/repostories/categories_repostory.dart';
import 'package:homework_34/features/onbording/managers/allergic_vew_model.dart';
import 'package:homework_34/features/onbording/managers/cusins_view_model.dart';
import 'package:homework_34/features/top_chef/managers/most_view_top_chef_model.dart';
import 'package:homework_34/features/trending_news/managers/all_view_model.dart';
import 'package:homework_34/features/trending_news/managers/most_view_model.dart';
import 'package:homework_34/features/category/managers/details_view_model.dart';
import 'package:homework_34/features/trending_news/managers/detail_veiw_model.dart';
import 'package:homework_34/features/category/managers/category_view_model.dart';
import 'package:homework_34/features/your_recipies/managers/your_recipeis_veiw_model.dart';
import 'package:homework_34/data/repostories/your_recipies_repostory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // API client va repository lar
    final apiClient = ApiClient();
    final onboardingRepository = OnboardingRepository(apiClient: apiClient);
    final allRepository        = AllRepository(apiClient: apiClient);
    final mostRepository       = MostRepository(apiClient: apiClient);
    final detailRepository     = DetailRepository(apiClient: apiClient);
    final topChefsRepository   = TopChefsRepostory(apiClient: apiClient);
    final categoryRepository   = CategoryRepository();
    final detailsRepository    = DetailsRepository();
    final yourRecipesRepository = YourRecipiesRepostory(apiClient: apiClient);

    return MultiProvider(
      providers: [
        // Basic repositories
        Provider<ApiClient>.value(value: apiClient),
        Provider<OnboardingRepository>.value(value: onboardingRepository),
        Provider<AllRepository>.value(value: allRepository),
        Provider<MostRepository>.value(value: mostRepository),
        Provider<DetailRepository>.value(value: detailRepository),
        Provider<TopChefsRepostory>.value(value: topChefsRepository),
        Provider<CategoryRepository>.value(value: categoryRepository),
        Provider<DetailsRepository>.value(value: detailsRepository),
        Provider<YourRecipiesRepostory>.value(value: yourRecipesRepository),

        // ChangeNotifierProviders
        ChangeNotifierProvider(
          create: (_) => AllergicViewModel(repository: onboardingRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => CusinsViewModel(repository: onboardingRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => MostViewTopChefModel(repository: topChefsRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => AllViewModel(repository: allRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => MostViewModel(repository: mostRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailViewModel(detailRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => YourRecipeisVeiwModel(yourRecipesRepository),
        ),
      ],
      child: Consumer<ThemeViewModel>(
        builder: (context, themeVM, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'My Cooking App',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeVM.currentTheme,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
