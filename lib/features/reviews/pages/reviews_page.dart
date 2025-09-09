import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/router/routes.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/data/models/category/reviews_model.dart';
import 'package:homework_34/features/reviews/managers/reviews_veiw_model.dart';
import 'package:homework_34/features/reviews/pages/leave_page.dart';
import 'package:homework_34/features/common/widgets/bottom_navigator_widget.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/data/models/recipe/recipies_model.dart';

class ReviewsPage extends StatelessWidget {
  final RecipeModel recipe; // ✅ tipni dynamicdan RecipeModel ga o'zgartirdik
  const ReviewsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReviewsViewModel(recipeId: recipe.id),
      child: Scaffold(
        appBar: CustomAppBar(title: "Revise", arrow: "assets/arrow.png"),
        body: Column(
          children: [
            Container(
              width: 430,
              height: 200,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.text,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        recipe.photo ?? '',
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 80,
                            height: 80,
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.image,
                              color: Colors.grey,
                              size: 30,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 5, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.title ?? 'Recipe Title',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Consumer<ReviewsViewModel>(
                              builder: (context, viewModel, child) {
                                return Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber, size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      (recipe.rating ?? 0.0).toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      viewModel.isLoading
                                          ? "Loading..."
                                          : "(${viewModel.reviews.length} Reviews)",
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 12,
                                  backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'By Chef Mathew',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                            const SizedBox(height: 4),
                           InkWell(
  onTap: () {
    context.push(Routes.leave, extra: recipe);
  },
  borderRadius: BorderRadius.circular(20),
  child: Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 6,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Text(
      'Add Review',
      style: TextStyle(
        color: Color(0xFFFF6B6B),
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
)

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Comments',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Consumer<ReviewsViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFFF6B6B),
                      ),
                    );
                  }
                  if (viewModel.error != null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Error loading reviews',
                            style: TextStyle(color: Colors.red),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: viewModel.fetchReviews,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF6B6B),
                            ),
                            child: const Text(
                              'Try Again',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (viewModel.reviews.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.rate_review_outlined,
                            color: Colors.grey,
                            size: 48,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No reviews yet',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: viewModel.reviews.length,
                    itemBuilder: (context, index) {
                      final review = viewModel.reviews[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: review.user.profilePhoto.isNotEmpty
                                  ? NetworkImage(review.user.profilePhoto)
                                  : const NetworkImage(
                                      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
                                    ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        _getUserDisplayName(review.user),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    review.title.isNotEmpty
                                        ? review.title
                                        : "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: List.generate(5, (starIndex) {
                                      return Icon(
                                        starIndex < review.rating.floor()
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: const Color(0xFFFF6B6B),
                                        size: 16,
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigatorNews(),
      ),
    );
  }

  String _getUserDisplayName(UserModel user) {
    final fullName = "${user.firstName} ${user.lastName}".trim();
    if (fullName.isNotEmpty) {
      return fullName;
    }
    if (user.username.isNotEmpty) {
      return user.username;
    }
    return "Anonymous User";
  }
}
