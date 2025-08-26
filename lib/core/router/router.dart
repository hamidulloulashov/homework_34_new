import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/data/models/trending_repostories_models/detail_model.dart';
import 'package:homework_34/features/auth/pages/login_page.dart';
import 'package:homework_34/features/auth/pages/register_page.dart';
import 'package:homework_34/features/category/pages/category_page.dart';
import 'package:homework_34/features/community/pages/community_page.dart';
import 'package:homework_34/features/onbording/pages/pagveiw_page.dart';
import 'package:homework_34/features/top_chef/pages/top_chefs_page.dart';
import 'package:homework_34/features/trending_news/pages/deatail_page.dart';
import 'package:homework_34/features/trending_news/pages/trending_recipes_page.dart';
import 'package:homework_34/features/your_recipies/pages/your_recipeis_page.dart';
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => PagveiwPage(),
      ),
      GoRoute(
        path: '/trending',
        name: 'trending',
        builder: (context, state) => TrendingRecipesPage(),
      ),
      GoRoute(
        path: '/top_chefs',
        name: 'top_chefs',
        builder: (context, state) => TopChefs(),
      ),
      GoRoute(
        path: '/detail',
        name: 'detail',
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
        path: '/category',
        name: 'category',
        builder: (context, state) => CategoryPage(name: "all"),
      ),
      GoRoute(
        path: '/community',
        name: 'community',
        builder: (context, state) => CommunityPage(),
      ),
         GoRoute(
        path: '/',
        name: 'your_resipies',
        builder: (context, state) => YourRecipeisPage(),
      ),
    ],
  );
}
