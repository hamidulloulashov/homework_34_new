import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import 'package:homework_34/core/widgets/custom_appbar_widget.dart';
import 'package:homework_34/data/models/trending_repostories_models/detail_model.dart';

class DetailPage extends StatelessWidget {
  final DetailModel recipe;
  const DetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: recipe.title, arrow: 'assets/arrow.png',),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.network(
                (recipe.photo ?? '').isNotEmpty
                    ? recipe.photo!
                    : 'https://via.placeholder.com/400x200',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.image,
                    size: 50,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              recipe.title ?? "No title",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    (recipe.user?.profilePhoto ?? '').isNotEmpty
                        ? recipe.user!.profilePhoto!
                        : 'https://via.placeholder.com/50',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "${recipe.user?.firstName ?? ''} ${recipe.user?.lastName ?? ''} (@${recipe.user?.username ?? ''})",
                    style: const TextStyle(fontSize: 14, color: AppColors.text),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              recipe.description ?? "No description",
              style: const TextStyle(fontSize: 16, color: AppColors.text),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: AppColors.text),
                const SizedBox(width: 5),
                Text(
                  "${recipe.timeRequired ?? 0} min",
                  style: TextStyle(color: AppColors.text),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.emoji_events, size: 16, color: AppColors.text),
                const SizedBox(width: 5),
                Text(
                  recipe.difficulty ?? 'Unknown',
                  style: TextStyle(color: AppColors.text),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.star, size: 16, color: AppColors.text),
                const SizedBox(width: 5),
                Text(
                  recipe.rating?.toStringAsFixed(1) ?? '0.0',
                  style: TextStyle(color: AppColors.text),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
