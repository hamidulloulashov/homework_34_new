import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import 'package:homework_34/core/widgets/custom_appbar_widget.dart';
import 'package:homework_34/core/widgets/bottom_navigator_widget.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/features/category/managers/category_view_model.dart';
import 'package:homework_34/features/category/pages/details.dart';
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryViewModel(
          repository: Provider.of(context, listen: false)), 
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Your Recipes",
          arrow: "assets/arrow.png",
          first: "assets/notifaction.png",
          second: "assets/search.png",
          containerColor: AppColors.container,
        ),
        body: Consumer<CategoryViewModel>(
          builder: (context, vm, _) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (vm.error != null) {
              return Center(child: Text(vm.error!));
            }

            if (vm.categories.isEmpty) {
              return const Center(child: Text("No categories found"));
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
                      crossAxisSpacing: 16,
                      childAspectRatio: 3/3.4, 
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                cat.image ?? "",
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 158,
                                
                              ),
                            ),
                            const SizedBox(height: 8),
                            Center(
                              child: Text(
                                cat.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: BottomNavigatorNews(),
      ),
    );
  }
}
