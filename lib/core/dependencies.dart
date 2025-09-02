import 'package:homework_34/core/client.dart';
import 'package:homework_34/data/repostories/top_chefs_repostory.dart';
import 'package:homework_34/data/repostories/trending_repostory.dart';
import 'package:homework_34/data/repostories/your_recipies_repostory.dart';
import 'package:homework_34/features/top_chef/managers/most_view_top_chef_model.dart';
import 'package:homework_34/features/trending_news/managers/most_view_model.dart';
import 'package:homework_34/features/your_recipies/managers/your_recipeis_veiw_model.dart';
import 'package:provider/provider.dart';
import '../data/repostories/categories_repostory.dart';
import '../data/repostories/onboarding_repostory.dart';
import '../features/common/managers/theme_view_model.dart';
import '../features/category/managers/category_view_model.dart'; 
import 'package:provider/single_child_widget.dart'; 
final List<SingleChildWidget> dependencies = [
  Provider<ApiClient>(
    create: (context) => ApiClient(),
  ),
  ChangeNotifierProvider<ThemeViewModel>(
    create: (_) => ThemeViewModel(),
  ),
  Provider<OnboardingRepository>(
    create: (context) => OnboardingRepository(
      apiClient: context.read<ApiClient>(),
    ),
  ),
  Provider<AllRepository>(
    create: (context) => AllRepository(
      apiClient: context.read<ApiClient>(),
    ),
  ),
  Provider<MostRepository>(
    create: (context) => MostRepository(
      apiClient: context.read<ApiClient>(),
    ),
  ),
  Provider<DetailRepository>(
    create: (context) => DetailRepository(
      apiClient: context.read<ApiClient>(),
    ),
  ),
  Provider<TopChefsRepostory>(
    create: (context) => TopChefsRepostory(
      apiClient: context.read<ApiClient>(),
    ),
  ),
  Provider<CategoryRepository>(
    create: (context) => CategoryRepository(
      apiClient: context.read<ApiClient>(),
    ),
  ),
  Provider<YourRecipiesRepostory>(
    create: (context) => YourRecipiesRepostory(
      apiClient: context.read<ApiClient>(),
    ),
  ),

  ChangeNotifierProvider<CategoryViewModel>(
    create: (context) => CategoryViewModel(
      repository: context.read<CategoryRepository>(),
    ),
  ),

  ChangeNotifierProvider<YourRecipeisVeiwModel>(
    create: (context) => YourRecipeisVeiwModel(
      context.read<YourRecipiesRepostory>(),
    ),
  ),

  ChangeNotifierProvider<MostViewTopChefModel>(
    create: (context) => MostViewTopChefModel(
      repository: context.read<TopChefsRepostory>(),
    ),
  ),

  ChangeNotifierProvider<MostViewModel>(
    create: (context) => MostViewModel(
      repository: context.read<MostRepository>(),
    ),
  ),
];
