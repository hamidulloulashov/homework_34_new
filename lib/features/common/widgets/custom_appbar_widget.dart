import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/core/utils/app_colors.dart';

import '../managers/theme_view_model.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title; 
  final List<Widget>? actions;
  final String? arrow;
  final String? first;
  final String? second;
  final Color? containerColor;
  final VoidCallback? onFirstPressed;
  final VoidCallback? onSecondPressed;

  const CustomAppBar({
    super.key,
    this.title, 
    this.actions,
    this.arrow,
    this.first,
    this.second,
    this.containerColor,
    this.onFirstPressed,
    this.onSecondPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.select<ThemeViewModel, bool>((vm) => vm.isDark);
    return AppBar(
      elevation: 0,
      leading: arrow != null
          ? GestureDetector(
              onTap: () {
                if (Navigator.of(context).canPop()) Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(arrow!, width: 20, height: 20),
              ),
            )
          : null,
      title: title != null 
          ? Center(
              child: Text(
                title!,
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : null,
      actions: [
        if (first != null)
          Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              color: containerColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Image.asset(first!, width: 18, height: 18),
              onPressed: onFirstPressed,
            ),
          ),
        if (second != null)
          Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: containerColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Image.asset(second!, width: 18, height: 18),
              onPressed: onSecondPressed,
            ),
          ),
        ...?actions,
        IconButton(
          icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
          onPressed: () => context.read<ThemeViewModel>().toggleTheme(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
