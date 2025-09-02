import 'package:flutter/material.dart';
import 'package:homework_34/core/dependencies.dart';
import 'package:homework_34/features/common/managers/theme_view_model.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/core/router/router.dart';
import 'package:homework_34/core/utils/app_themes.dart';
void main() {
  runApp(
    MultiProvider(
      providers: dependencies,
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My Cooking App',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: context.watch<ThemeViewModel>().currentTheme,
      routerConfig: AppRouter.router,
    );
  }
}
