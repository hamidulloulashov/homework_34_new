import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/router/routes.dart';
import 'package:homework_34/data/models/trending/detail_model.dart';
import 'package:homework_34/features/add_recipeis/pages/add_resipeis_page.dart';
import 'package:homework_34/features/auth/pages/login_page.dart';
import 'package:homework_34/features/auth/pages/register_page.dart';
import 'package:homework_34/features/category/pages/category_page.dart';
import 'package:homework_34/features/community/pages/community_page.dart';
import 'package:homework_34/features/floating_menu_profile/pages/notifaction_pages.dart';
import 'package:homework_34/features/floating_menu_profile/pages/settings_page.dart';
import 'package:homework_34/features/onbording/pages/pagveiw_page.dart';
import 'package:homework_34/features/top_chef/pages/top_chefs_page.dart';
import 'package:homework_34/features/trending_news/pages/deatail_page.dart';
import 'package:homework_34/features/trending_news/pages/trending_recipes_page.dart';
import 'package:homework_34/features/your_recipies/pages/your_recipeis_page.dart';
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.settings,
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
        path: Routes.onboarding,
        builder: (context, state) => PagveiwPage(),
      ),
      GoRoute(
        path: Routes.trending,
        builder: (context, state) => TrendingRecipesPage(),
      ),
      GoRoute(
        path:Routes.top_chefs,
        builder: (context, state) => TopChefs(),
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
        path: Routes.community,
        builder: (context, state) => CommunityPage(),
      ),
         GoRoute(
        path: Routes.your_resipies,
        builder: (context, state) => YourRecipeisPage(),
      ),
      GoRoute(path: Routes.add_resipies,
      builder: (context, state) => AddResipeisPage(),
      ),
          GoRoute(path: Routes.settings,
      builder: (context, state) => SettingsPage(),
      ),
           GoRoute(path: Routes.notifaction,
      builder: (context, state) => NotifactionPages(),
      ),
    ],
  );
}
