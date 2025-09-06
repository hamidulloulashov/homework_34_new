import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/data/repostories/home_repostory.dart';
import 'package:homework_34/features/common/widgets/favourite_widget.dart';
import 'package:homework_34/features/home/managers/recipe_view_model.dart';
import 'package:provider/provider.dart';

class RecipeisWidget extends StatelessWidget {
  const RecipeisWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = RecipeViewModel(repository: Repository(apiClient: ApiClient()));
        vm.fetchRecipes();
        return vm;
      },
      child: Consumer<RecipeViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.error != null) {
            return Center(child: Text('Xato: ${vm.error}'));
          }
          if (vm.recipes.isEmpty) {
            return const Center(child: Text("Ma'lumot topilmadi"));
          }

          return Padding(
            padding: const EdgeInsets.only(),
            child: Container(
              width: 430,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColors.text,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Your recipes",
                      style: TextStyle(color: AppColors.white, fontSize: 15),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: vm.recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = vm.recipes[index];
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    recipe.photo,
                                    width: 168,
                                    height: 162,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: const FavouriteWidget(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 120),
                                  child: Container(
                                    width: 168,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            recipe.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            recipe.description,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                recipe.rating.toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.icons,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Image.asset(
                                                "assets/star.png",
                                                width: 14,
                                              ),
                                              const SizedBox(width: 12),
                                              const Icon(
                                                Icons.alarm,
                                                size: 14,
                                                color: AppColors.icons,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${recipe.timeRequired} min',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.icons,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
