import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/utils/app_colors.dart';

class BottomNavigatorNews extends StatelessWidget {
  const BottomNavigatorNews({super.key});

  final List<String> icons = const [
    "assets/home.png",
    "assets/message.png",
    "assets/box.png",
    "assets/profile.png",
  ];

  int _getSelectedIndex(String location) {
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/community')) return 1;
    if (location.startsWith('/category')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.push('/home');
        break;
      case 1:
        context.push('/community');
        break;
      case 2:
        context.push('/category');
        break;
      case 3:
        context.push('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    final int selectedIndex = _getSelectedIndex(location);

    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
      child: Container(
        width: 200,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: AppColors.text,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onInverseSurface.withAlpha(200),
              blurRadius: 50,
              spreadRadius: 20,
              offset: const Offset(0, 30),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(icons.length, (index) {
            final bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () => _onItemTapped(context, index),
              child: ColorFiltered(
                colorFilter: isSelected
                    ? const ColorFilter.mode(AppColors.white, BlendMode.srcIn) 
                    : const ColorFilter.mode(AppColors.container, BlendMode.srcIn), 
                child: Image.asset(
                  icons[index],
                  width: 25,
                  height: 22,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
