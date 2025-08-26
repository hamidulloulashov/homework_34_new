import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework_34/core/utils/theme/colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      surface: AppColors.white,
      background: AppColors.white,
      onPrimary: AppColors.white,
      onSurface: AppColors.textDark,
      onBackground: AppColors.textDark,
    ),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: false,
      foregroundColor: AppColors.textDark,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
    ).apply(
      bodyColor: AppColors.textDark,
      displayColor: AppColors.textDark,
    ),
    iconTheme: IconThemeData(color: AppColors.icons),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.amber,
      foregroundColor: AppColors.textDark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        minimumSize: const Size(48, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: AppColors.text,
      surface: AppColors.primary,
      background: AppColors.primary,
      onPrimary: AppColors.white,
      onSurface: AppColors.white70,
      onBackground: AppColors.white70,
    ),
    scaffoldBackgroundColor: AppColors.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: false,
      foregroundColor: AppColors.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
    ).apply(
      bodyColor: AppColors.white70,
      displayColor: AppColors.white70,
    ),
    iconTheme: IconThemeData(color: AppColors.amber),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.text,
      foregroundColor: AppColors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.text,
        foregroundColor: AppColors.white,
        minimumSize: const Size(48, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
