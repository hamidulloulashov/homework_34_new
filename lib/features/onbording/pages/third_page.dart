import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import 'package:homework_34/core/widgets/custom_appbar_widget.dart';
import 'package:homework_34/features/onbording/managers/third_view_model.dart';
import 'package:homework_34/features/onbording/pages/cooking_livel_page.dart';
import 'package:provider/provider.dart';
class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThirdViewModel(),
      builder: (context, child) => Scaffold(
        appBar: CustomAppBar(arrow:'assets/arrow.png'),
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
                  style: TextStyle( color: Theme.of(context).colorScheme.inverseSurface,),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CookingLivel()),
                      );
                    },
                    child: Container(
                      width: 162,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: AppColors.container,
                      ),
                      child: const Center(
                        child: Text(
                          "I’m New",
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
                  child: Container(
                    width: 162,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: AppColors.container,
                    ),
                    child: const Center(
                      child: Text(
                        "I’ve been here ",
                        style: TextStyle(
                          color: AppColors.icons,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
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
