import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/data/repostories/home_repostory.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../common/widgets/favourite_widget.dart';
import '../managers/trending_view_model.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = TrendingViewModel(repository: Repository(apiClient: ApiClient()));
        vm.fetchTrending();
        return vm;
      },
      child: Consumer<TrendingViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.error != null) {
            return Center(child: Text('Xato: ${vm.error}'));
          }
          if (vm.trending.isEmpty) {
            return const Center(child: Text("Ma'lumot topilmadi"));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  "Trending Recipe",
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 220,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 220,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  items: vm.trending.map((menu) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: 348,
                          height: 182,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.icons),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: -3,
                                left: -10,
                                right: -10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    menu.photo,
                                    height: 180,
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
                                  top: 175,
                                  left: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      menu.title,
                                      style:  TextStyle(
                                        color: Theme.of(context).colorScheme.inverseSurface,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        menu.description,
                                        style:  TextStyle(
                                          color: Theme.of(context).colorScheme.inverseSurface,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 260,
                                  top: 180,
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
                                  top: 195,
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
                                    Image.asset("assets/star.png", width: 14),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
