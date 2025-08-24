import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import 'package:homework_34/features/trending_news/managers/most_view_model.dart';
import 'package:homework_34/features/trending_news/widgets/favourite_widget.dart';
import 'package:provider/provider.dart';

class MostWidget extends StatelessWidget {
  const MostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MostViewModel>(
      builder: (context, vm, child) {
        if (vm.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (vm.error != null) {
          return Center(child: Text("Xatolik: ${vm.error}"));
        }
        if (vm.menus.isEmpty) {
          return const Center(child: Text("Ma'lumot topilmadi"));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 260,
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 260,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: vm.menus.map((menu) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          Container(
                            width: 430,
                            height: 260,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.text,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                "Most Viewed Today",
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: 348,
                              height: 182,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.white,
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    top: -3,
                                    left: -5,
                                    right: -5,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(12),
                                      child: Image.network(
                                        menu.photo,
                                        height: 143,
                                        width: 340,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: const FavouriteWidget(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 140,
                                      left: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              menu.title,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 200,
                                              child: Text(
                                                menu.description,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 260,
                                      top: 145,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.alarm,
                                          size: 15,
                                          color: AppColors.icons,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '${menu.timeRequired} min',
                                          style: const TextStyle(
                                            color: AppColors.icons,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 300,
                                      top: 160,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          menu.rating.toString(),
                                          style: const TextStyle(
                                            color: AppColors.icons,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Image.asset(
                                          "assets/star.png",
                                          width: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
