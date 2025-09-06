import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/data/repostories/home_repostory.dart';
import 'package:homework_34/features/home/managers/recently_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../common/widgets/favourite_widget.dart';

class RecentlyWidget extends StatelessWidget {
  const RecentlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = RecentlyViewModel(repository: Repository(apiClient: ApiClient()));
        vm.fetchRecently();
        return vm;
      },
      child: Consumer<RecentlyViewModel>(
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
            padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Recently Added",
                  style: TextStyle(color: AppColors.text, fontSize: 15),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: vm.recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = vm.recipes[index];
                      return Container(
                        margin: const EdgeInsets.only(right: 15),
                        width: 170,
                        height: 190,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 168,
                              height: 226,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                recipe.photo,
                                width: 168,
                                height: 162,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            Positioned(
                              top: 8,
                              right: 8,
                              child: const FavouriteWidget(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}
