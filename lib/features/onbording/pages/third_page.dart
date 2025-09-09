import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/router/routes.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/onbording/managers/third_view_model.dart';
import 'package:provider/provider.dart';
class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThirdViewModel(),
      builder: (context, child) => Scaffold(
        extendBody: true,
        body: Consumer<ThirdViewModel>(
          builder: (context, vm, child) {
            if (vm.third.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1.2,
                        ),
                    itemCount: vm.third.length,
                    itemBuilder: (context, index) {
                      final item = vm.third[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item.image,
                          width: 168,
                          height: 168,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                Text(
                  "Find the best recipes that the world can provide you\nalso with every step that you can learn to increase\nyour cooking skills.",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: GestureDetector(
                    onDoubleTap: () =>  GoRouter.of(context).go('/login'),
                    child: Container(
                      width: 162,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: AppColors.container,
                      ),
                      child: const Center(
                        child: Text(
                          "I'm New",
                          style: TextStyle(
                            color: AppColors.icons,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: GestureDetector(
                 onDoubleTap: () => GoRouter.of(context).go(Routes.cooking_level),
                    child: Container(
                      width: 162,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: AppColors.container,
                      ),
                      child: const Center(
                        child: Text(
                          "I've been here",
                          style: TextStyle(
                            color: AppColors.icons,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}