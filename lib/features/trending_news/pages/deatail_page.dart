import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/data/models/trending_repostories_models/detail_model.dart';

class DetailPage extends StatelessWidget {
  final DetailModel recipe;
  const DetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              GoRouter.of(context).pop();
            } else {
              GoRouter.of(context).go('/');
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe.photo.isNotEmpty
                  ? recipe.photo
                  : 'https://via.placeholder.com/400x200',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              recipe.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    recipe.user.profilePhoto.isNotEmpty
                        ? recipe.user.profilePhoto
                        : 'https://via.placeholder.com/50',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "${recipe.user.firstName} ${recipe.user.lastName} (@${recipe.user.username})",
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              recipe.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 5),
                Text("${recipe.timeRequired} min"),
                const SizedBox(width: 20),
                const Icon(Icons.emoji_events, size: 16),
                const SizedBox(width: 5),
                Text(recipe.difficulty),
                const SizedBox(width: 20),
                const Icon(Icons.star, size: 16, color: Colors.orange),
                const SizedBox(width: 5),
                Text(recipe.rating.toStringAsFixed(1)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
