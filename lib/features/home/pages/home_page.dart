import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/common/widgets/bottom_navigator_widget.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/features/home/widgets/recipeis_widget.dart';
import 'package:homework_34/features/home/widgets/top_chefs.dart';
import 'package:homework_34/features/home/widgets/trending_widget.dart';
import '../../category/pages/details.dart';
import '../widgets/trending_recipe_widget.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> categories = const [
    {"id": 2, "name": "Breakfast"},
    {"id": 7, "name": "Lunch"},
    {"id": 5, "name": "Dinner"},
    {"id": 10, "name": "Vegan"},
    {"id": 1, "name": "Seafood"},
    {"id": 3, "name": "Dessert"},
    {"id": 4, "name": "Cookies"},
    {"id": 6, "name": "Drinks"},
    {"id": 9, "name": "Salads"},
    {"id": 8, "name": "Meat"},
  ];

  int selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigatorNews(),
      appBar: CustomAppBar(
        containerColor: AppColors.container,
        first: "assets/notifaction.png",
        second: "assets/search.png",
        customWidget: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi! Dianne",
                style: TextStyle(color: AppColors.text, fontSize: 25),
              ),
              Text(
                "What are you cooking today",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                final bool isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsPage(
                          categoryId: cat['id'],
                          categoryName: cat['name'],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, left: 25),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.text : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                       
                      ),
                      child: Text(
                        cat['name'],
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.text,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
       body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
  child: Column(
    children:  [
      SizedBox(
        height: 260, 
        child: TrendingWidget(),
      ),
      SizedBox(height: 10,),
      RecipeisWidget(),
      SizedBox(height: 10,),
    ChefWidget(),
    RecentlyWidget(),
    ],
  ),
),

    );
  }
}
