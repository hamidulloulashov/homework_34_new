import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import 'package:homework_34/features/category/pages/recipe_deatils.dart';
import 'package:homework_34/features/trending_news/widgets/bottom_navigator_widget.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/features/category/managers/details_view_model.dart';

class DetailsPage extends StatefulWidget {
  final int categoryId;
  final String categoryName;

  const DetailsPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late int selectedCategoryId;
  late String selectedCategoryName;

  final List<Map<String, dynamic>> categories = [
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

  @override
  void initState() {
    super.initState();
    selectedCategoryId = widget.categoryId;
    selectedCategoryName = widget.categoryName;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = DetailsViewModel();
        vm.fetchRecipes(widget.categoryId);
        return vm;
      },
      child: Consumer<DetailsViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            backgroundColor: AppColors.primary,
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              centerTitle: true,
              iconTheme: IconThemeData(color: AppColors.text),
              title: Text(
                selectedCategoryName,
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                Image.asset("assets/notifaction.png", width: 28, height: 28),
                const SizedBox(width: 8),
                Image.asset("assets/search.png", width: 28, height: 28),
                const SizedBox(width: 12),
              ],
            ),
            body: Column(
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      final isSelected = cat['id'] == selectedCategoryId;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ChoiceChip(
                          label: Text(
                            cat['name'],
                            style: TextStyle(
                              color: isSelected ? Colors.white : AppColors.text,
                            ),
                          ),
                          selected: isSelected,
                          selectedColor: AppColors.text,
                          backgroundColor: AppColors.primary,
                          side: BorderSide.none,
                          showCheckmark: false,
                          onSelected: (_) {
                            setState(() {
                              selectedCategoryId = cat['id'];
                              selectedCategoryName = cat['name'];
                            });
                            context.read<DetailsViewModel>().fetchRecipes(
                              selectedCategoryId,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: vm.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : vm.error != null
                      ? Center(child: Text(vm.error!))
                      : vm.recipes.isEmpty
                      ? const Center(
                          child: Text("Bu kategoriyada retsept yo'q"),
                        )
                      : GridView.builder(
                          padding: const EdgeInsets.all(16),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 0.75,
                              ),
                          itemCount: vm.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = vm.recipes[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RecipeDetailsPage(recipe: recipe),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      child: Image.network(
                                        recipe.photo,
                                        fit: BoxFit.cover,
                                        height: 120,
                                        width: double.infinity,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            recipe.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            recipe.description,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.orange,
                                                    size: 14,
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Text(
                                                    recipe.rating.toString(),
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.orange,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.access_time,
                                                    color: Colors.grey,
                                                    size: 14,
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Text(
                                                    "${recipe.timeRequired} min",
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
                BottomNavigatorNews(),
                SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}
