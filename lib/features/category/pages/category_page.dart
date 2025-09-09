import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/features/common/widgets/bottom_navigator_widget.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/features/category/managers/category_view_model.dart';
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        title: "Categories",
        arrow: "assets/arrow.png",
        first: "first",
        second: "search",
        containerColor: AppColors.container,
      ),
      body: Consumer<CategoryViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (vm.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(vm.error!),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: vm.refresh,
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }
          
          if (vm.categories.isEmpty) {
            return const Center(child: Text("No categories found"));
          }
          
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              childAspectRatio: 3 / 3.4,
            ),
            itemCount: vm.categories.length,
            itemBuilder: (context, index) {
              final cat = vm.categories[index];
              return GestureDetector(
                onTap: () {
  context.push(
    "/details/${cat.id}",
    extra: {
      "categoryName": cat.title,
    },
  );
},

                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        cat.image ?? "",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 158,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: double.infinity,
                          height: 158,
                          color: Colors.grey[300],
                          child: const Icon(Icons.broken_image),
                        ),
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
          );
        },
      ),
      bottomNavigationBar: BottomNavigatorNews(),
    );
  }
}
