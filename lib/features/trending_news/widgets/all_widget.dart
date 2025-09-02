import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/trending_news/managers/detail_veiw_model.dart';
import 'package:provider/provider.dart';
import '../../common/widgets/favourite_widget.dart';

class AllWidget extends StatelessWidget {
  const AllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailViewModel>(
      builder: (context, vm, child) {
        if (vm.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (vm.error != null) {
          return Center(child: Text("Xatolik: ${vm.error}"));
        }
        if (vm.recipes.isEmpty) {
          return const Center(child: Text("Ma'lumot topilmadi"));
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(15),
          itemCount: vm.recipes.length,
          itemBuilder: (context, index) {
            final recipe = vm.recipes[index];
            return GestureDetector(
              onTap: () {
                context.push(
                  '/detail',
                  extra: recipe, 
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 122,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          Image.network(
                            recipe.photo,
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(color: Colors.grey),
                          ),
                          const Positioned(
                            left: 95,
                            top: 5,
                            child: FavouriteWidget(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              recipe.description,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              "By Chef Josh Ryan",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.pink,
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset("assets/alarm.png", width: 10, height: 10),
                                const SizedBox(width: 3),
                                Text(
                                  "${recipe.timeRequired} min",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.text,
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Text(
                                  recipe.difficulty,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.text,
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Text(
                                  "${recipe.rating}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.text,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Image.asset("assets/star.png", width: 10, height: 10),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
