import 'package:flutter/material.dart';
import 'package:homework_34/features/trending_news/widgets/bottom_navigator_widget.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import '../widgets/most_widget.dart';
import '../managers/most_view_top_chef_model.dart';

class TopChefs extends StatefulWidget {
  const TopChefs({super.key});

  @override
  State<TopChefs> createState() => _TopChefsState();
}

class _TopChefsState extends State<TopChefs> {
  @override
  void initState() {
    super.initState();
    context.read<MostViewTopChefModel>().loadChefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.arrow_back, color: AppColors.text),
            const SizedBox(width: 100),
            Text(
              "Top chefs",
              style: TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 60),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.container,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Image.asset(
                  "assets/notifaction.png",
                  width: 25,
                  height: 25,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.container,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Image.asset("assets/search.png", width: 25, height: 30),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: const MostWidget(),
      bottomNavigationBar: BottomNavigatorNews(),
    );
  }
}
