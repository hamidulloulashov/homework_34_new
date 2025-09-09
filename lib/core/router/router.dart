import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/router/routes.dart';
import 'package:homework_34/data/models/recipe/recipies_model.dart';
import 'package:homework_34/data/models/trending/detail_model.dart';
import 'package:homework_34/features/add_recipeis/pages/add_resipeis_page.dart';
import 'package:homework_34/features/auth/pages/forgot_frist.dart';
import 'package:homework_34/features/auth/pages/forgot_passwor_page.dart';
import 'package:homework_34/features/auth/pages/forgot_password.dart';
import 'package:homework_34/features/auth/pages/login_page.dart';
import 'package:homework_34/features/auth/pages/register_page.dart';
import 'package:homework_34/features/category/pages/category_page.dart';
import 'package:homework_34/features/category/pages/details.dart';
import 'package:homework_34/features/category/pages/recipe_deatils.dart';
import 'package:homework_34/features/common/pages/notifaction_page.dart';
import 'package:homework_34/features/community/pages/community_page.dart';
import 'package:homework_34/features/floating_menu_profile/pages/help_center.dart';
import 'package:homework_34/features/floating_menu_profile/pages/languageSCreen.dart';
import 'package:homework_34/features/floating_menu_profile/pages/notifaction.dart';
import 'package:homework_34/features/floating_menu_profile/pages/policy_page.dart';
import 'package:homework_34/features/floating_menu_profile/pages/settings_page.dart';
import 'package:homework_34/features/following/pages/following_and_followers_page.dart';
import 'package:homework_34/features/home/pages/home_page.dart';
import 'package:homework_34/features/home/pages/splash_page.dart';
import 'package:homework_34/features/onbording/pages/cooking_livel_page.dart';
import 'package:homework_34/features/onbording/pages/pagveiw_page.dart';
import 'package:homework_34/features/profile/pages/edit_profile.dart';
import 'package:homework_34/features/profile/pages/profile_page.dart';
import 'package:homework_34/features/profile/pages/share_profile.dart';
import 'package:homework_34/features/reviews/pages/leave_page.dart';
import 'package:homework_34/features/reviews/pages/reviews_page.dart';
import 'package:homework_34/features/top_chef/pages/chef_detail_page.dart';
import 'package:homework_34/features/top_chef/pages/top_chefs_page.dart';
import 'package:homework_34/features/trending_news/pages/deatail_page.dart';
import 'package:homework_34/features/trending_news/pages/trending_recipes_page.dart';
import 'package:homework_34/features/your_recipies/pages/your_recipeis_page.dart';
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.login,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => RegisterPage(),
      ),
         GoRoute(
        path: Routes.notificationPages,
        builder: (context, state) => NotificationPage(),
      ),
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => PagveiwPage(),
      ),
            GoRoute(
        path: Routes.language,
        builder: (context, state) => LanguageScreen(),
      ),
      GoRoute(
        path: Routes.trending,
        builder: (context, state) => TrendingRecipesPage(),
      ),
          GoRoute(
        path: Routes.policy,
        builder: (context, state) => PolicyPage(),
      ),
          GoRoute(
        path: Routes.help,
        builder: (context, state) => HelpCenterScreen(),
      ),
      GoRoute(
        path:Routes.top_chefs,
        builder: (context, state) => TopChefs(),
      ),
           GoRoute(
        path:Routes.edit,
        builder: (context, state) => EditProfile(),
      ),
          GoRoute(
        path:Routes.shared,
        builder: (context, state) => SharedProfile(),
      ),
      GoRoute(
        path:Routes.detail,
        builder: (context, state) {
          final recipe = state.extra as DetailModel?;
          if (recipe == null) {
            return Scaffold(
              body: Center(child: Text("No recipe found")),
            );
          }
          return DetailPage(recipe: recipe);
        },
      ),
      GoRoute(
        path: Routes.category,
        builder: (context, state) => CategoryPage(name: "all"),
      ),
      GoRoute(
  path: '/details/:id',
  builder: (context, state) {
    final id = int.parse(state.pathParameters['id']!);
    final extra = state.extra as Map?;
    final categoryName = extra?['categoryName'] ?? "";
    return DetailsPage(
      categoryId: id,
      categoryName: categoryName,
    );
  },
),

      GoRoute(
        path: Routes.community,
        builder: (context, state) => CommunityPage(),
      ),
      GoRoute(
        path: Routes.your_resipies,
        builder: (context, state) => YourRecipeisPage(),
      ),
      GoRoute(
        path: Routes.add_resipies,
        builder: (context, state) => AddResipeisPage(),
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) => SettingsPage(),
      ),
      GoRoute(
        path: Routes.notifaction,
        builder: (context, state) => Notifaction(),
      ),
      GoRoute(
        path: Routes.followers,
        builder: (context, state) => FollowingAndFollowersPage(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: Routes.profile,
        builder: (context, state) => ProfilePage(),
      ),
      GoRoute(
        path: Routes.cooking_level,
        builder: (context, state) => CookingLivel(),
      ),
         GoRoute(
        path: Routes.got_email,
        builder: (context, state) => ForgotFrist(),
      ),
          GoRoute(
        path: Routes.forgot,
        builder: (context, state) => ForgotPassword(),
      ),
               GoRoute(
        path: Routes.forgot2,
        builder: (context, state) => ForgotPasswordPage(),
      ),
GoRoute(
  path: Routes.leave,
  builder: (context, state) {
    final recipe = state.extra as RecipeModel; 
    return LeavePage(recipe: recipe);
  },
),
GoRoute(
  path: Routes.reviews,
  builder: (context, state) {
    final recipe = state.extra as RecipeModel; 
    return ReviewsPage(recipe: recipe);
  },
),

      GoRoute(
        path: Routes.chef_detail,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          if (extra == null) {
            return const Scaffold(
              body: Center(child: Text("No chef data found")),
            );
          }
          return ChefDetail(
            id: extra['id'] as int,
            username: extra['username'] as String,
          );
        },
      ),
      GoRoute(
  path: '/recipe-details',
  builder: (context, state) {
    final recipe = state.extra;
    if (recipe == null) {
      return const Scaffold(
        body: Center(child: Text("No recipe data found")),
      );
    }
    return RecipeDetailsPage(recipe: recipe);
  },
),




    ],
  );
}


