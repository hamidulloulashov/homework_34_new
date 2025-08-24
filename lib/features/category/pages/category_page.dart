import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import 'package:homework_34/features/category/widgets/app_bar_widget.dart';
import 'package:homework_34/features/category/widgets/bottom_navigator_widget.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/features/category/managers/category_view_model.dart';
import 'package:homework_34/features/category/pages/details.dart';
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryViewModel(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: AppBarWidget(),
        ),
        body: Consumer<CategoryViewModel>(
          builder: (context, vm, _) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (vm.error != null) {
              return Center(child: Text(vm.error!));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemCount: vm.categories.length,
                    itemBuilder: (context, index) {
                      final cat = vm.categories[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsPage(
                                categoryId: cat.id,
                                categoryName: cat.title,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                cat.image ?? "",
                                fit: BoxFit.cover,
                                width: 159,
                                height: 144,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.image, size: 40),
                                    ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              cat.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, bottom: 30),
                  child: BottomNavigator(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
