import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import 'package:homework_34/core/widgets/custom_appbar_widget.dart';
import 'package:homework_34/data/repostories/community_repostory.dart';
import 'package:homework_34/features/community/managers/community_view_model.dart';
import 'package:homework_34/features/community/widgets/community_bottomappbar_widget.dart';
import 'package:homework_34/core/widgets/bottom_navigator_widget.dart';
import 'package:homework_34/core/widgets/favourite_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  Widget shimmerBox({double? width, double? height, double radius = 8}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          CommunityViewModel(CommunityRepository(ApiClient())),
      builder: (context, child) => Consumer<CommunityViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                shimmerBox(width: 35, height: 35, radius: 17),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    shimmerBox(width: 100, height: 15),
                                    const SizedBox(height: 5),
                                    shimmerBox(width: 60, height: 12),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            shimmerBox(width: double.infinity, height: 173),
                            const SizedBox(height: 10),
                            shimmerBox(width: double.infinity, height: 79),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            );
          }

          if (vm.recipes.isEmpty) {
            return const Center(child: Text("No recipes found"));
          }

          return Scaffold(
            appBar: CustomAppBar(title: "Comunity", arrow: "assets/arrow.png",first: "assets/notifaction.png",second: "assets/search.png",containerColor: AppColors.container,),
            bottomNavigationBar: const BottomNavigatorNews(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  left: 36,
                  bottom: 100,
                ),
                child: Column(
                  
                  children: [
                    SizedBox(height: 20,),
                     CommunityWidget(),
                    const SizedBox(height: 22),
                    ...List.generate(vm.recipes.length, (index) {
                      final items = vm.recipes[index];
                      return SizedBox(
                        width: 356,
                        height: 319.5,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(17),
                                  child: Image.network(
                                    items.user.profilePhoto,
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return shimmerBox(
                                          width: 35, height: 35, radius: 17);
                                    },
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            shimmerBox(
                                                width: 35,
                                                height: 35,
                                                radius: 17),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '@${items.user.username}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.text,
                                      ),
                                    ),
                                    Text(
                                      '${items.created.month.toString()} Month ago',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.text,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Column(
                              
                              children: [
                                
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(14),
                                    topLeft: Radius.circular(14),
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        items.photo,
                                        width: 356,
                                        height: 173,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (context, child,
                                            loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return shimmerBox(
                                              width: 356, height: 173);
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                shimmerBox(
                                                    width: 356, height: 173),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 270, top: 5),
                                        child: FavouriteWidget(),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 370,
                                  height: 79,
                                  decoration: BoxDecoration(
                                    color: AppColors.text,
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(14),
                                      bottomLeft: Radius.circular(14),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            items.title,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Image.asset(
                                            "assets/star.png",
                                            color: AppColors.white,
                                            width: 10,
                                          ),
                                          Text(
                                            items.rating.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 258,
                                            height: 45,
                                            child: Text(
                                              items.description,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/alarm.png",
                                                    color: AppColors.white,
                                                    width: 10,
                                                  ),
                                                  SizedBox(width: 3,),
                                                  Text(
                                                    '${items.timeRequired} min',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    items.reviewsCount
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                  SizedBox(width: 3,),
                                                  Image.asset(
                                                    "assets/message.png",
                                                    color: AppColors.white,
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
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
