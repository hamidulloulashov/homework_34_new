import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/profile/pages/profile_page.dart';
class BottomNavigatorNews extends StatefulWidget {
  const BottomNavigatorNews({super.key});
  @override
  State<BottomNavigatorNews> createState() => _BottomNavigatorState();
}
class _BottomNavigatorState extends State<BottomNavigatorNews> {
  int selectedIndex = 0;

  final List<String> icons = [
    "assets/home.png",
    "assets/message.png",
    "assets/box.png",
    "assets/profile.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
      child: Container(
        width: 200,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: AppColors.text,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(icons.length, (index) {
            bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                if (index == icons.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                }
              },
              child: ColorFiltered(
                colorFilter: isSelected
                    ? const ColorFilter.mode(AppColors.white, BlendMode.srcIn)
                    : const ColorFilter.mode(
                        AppColors.container,
                        BlendMode.srcIn,
                      ),
                child: Image.asset(icons[index], width: 25, height: 22),
              ),
            );
          }),
        ),
      ),
    );
  }
}
