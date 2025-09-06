import 'package:flutter/material.dart';
import 'package:homework_34/features/following/managers/following_veiw_model.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/data/repostories/following_repostory.dart';

class FollowingWidget extends StatelessWidget {
  const FollowingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FollowingVeiwModel(repository: FollowingRepostory()),
      child: Consumer<FollowingVeiwModel>(
        builder: (context, model, child) {
          if (model.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (model.error != null) {
            return Center(child: Text("Error: ${model.error}"));
          }
          if (model.following.isEmpty) {
            return const Center(child: Text("No following found."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: model.following.length,
            itemBuilder: (context, index) {
              final user = model.following[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        user.profilePhoto.isNotEmpty
                            ? user.profilePhoto
                            : "https://via.placeholder.com/61",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "@${user.username}",
                          style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${user.firstName} ${user.lastName}",
                          style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 109,
                      height: 21,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: AppColors.container,
                      ),
                      child: const Center(
                        child: Text(
                          "Following",
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      "assets/third.png",
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
