import 'package:flutter/material.dart';
import 'package:homework_34/core/router/router.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/data/repostories/onboarding_repostory.dart';
import 'package:homework_34/data/repostories/trending_repostory.dart';
import 'package:homework_34/data/repostories/top_chefs_repostory.dart';
import 'package:homework_34/features/onbording/managers/allergic_vew_model.dart';
import 'package:homework_34/features/onbording/managers/cusins_view_model.dart';
import 'package:homework_34/features/top_chef/managers/most_view_top_chef_model.dart';
import 'package:homework_34/features/trending_news/managers/all_view_model.dart';
import 'package:homework_34/features/trending_news/managers/most_view_model.dart';
import 'package:homework_34/features/trending_news/managers/detail_veiw_model.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ApiClient apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    final onboardingRepository = OnboardingRepository(apiClient: apiClient);
    final allRepository = AllRepository(apiClient: apiClient);
    final mostRepository = MostRepository(apiClient: apiClient);
    final detailRepository = DetailRepository(apiClient: apiClient);
    final topChefsRepository = TopChefsRepostory(apiClient: apiClient);

    return MultiProvider(
      providers: [
        Provider<ApiClient>.value(value: apiClient),
        Provider<OnboardingRepository>.value(value: onboardingRepository),
        Provider<AllRepository>.value(value: allRepository),
        Provider<MostRepository>.value(value: mostRepository),
        Provider<DetailRepository>.value(value: detailRepository),
        Provider<TopChefsRepostory>.value(value: topChefsRepository),
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
          create: (context) => DetailViewModel(
            Provider.of<DetailRepository>(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'My Cooking App',
        theme: ThemeData.light(),
        routerConfig: AppRouter.router, 
      ),
    );
  }
}