import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/data/repostories/your_recipies_repostory.dart';
import 'package:homework_34/features/common/widgets/bottom_navigator_widget.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/features/floating_menu_profile/pages/settings_page.dart';
import 'package:homework_34/features/profile/managers/favourite_veiw_model.dart';
import 'package:homework_34/features/profile/managers/profile_view_model.dart';
import 'package:homework_34/features/profile/widgets/recipe_detail_wigdet.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/data/repostories/profile_repostory.dart';
import 'package:homework_34/core/client.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProfileViewModel(
            profileRepostory: ProfileRepostory(apiClient: ApiClient()),
          )..fetchProfile(),
        ),
       ChangeNotifierProvider(
  create: (_) => FavouriteVeiwModel(
    repository: context.read<YourRecipiesRepostory>(),
  ),
),
      ],
      child: Scaffold(
        bottomNavigationBar: BottomNavigatorNews(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Consumer<ProfileViewModel>(
            builder: (context, vm, child) {
              return CustomAppBar(
                title: vm.profile?.username ?? "Profile",
                arrow: 'assets/arrow.png',
                first: 'assets/plus.png',
                second: "assets/teng.png",
                containerColor: AppColors.container,
                onSecondPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage(),),);
                },
              );
            },
          ),
        ),
        body: Consumer<ProfileViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) return const Center(child: CircularProgressIndicator());
            if (vm.error != null) return Center(child: Text("Xato: ${vm.error}"));
            if (vm.profile == null) return const Center(child: Text("Profile topilmadi"));
            
            final profile = vm.profile!;
            
            return CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: ProfileHeaderDelegate(profile: profile),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            width: 356,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppColors.container,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '        ${profile.recipesCount}\n Retseptlar',
                                  style: TextStyle(color: AppColors.text),
                                ),
                                Container(
                                  width: 2,
                                  height: 26,
                                  color: AppColors.container,
                                ),
                                Text(
                                  '       ${profile.followerCount}\n Follower',
                                  style: TextStyle(color: AppColors.text),
                                ),
                                Container(
                                  width: 2,
                                  height: 26,
                                  color: AppColors.container,
                                ),
                                Text(
                                  '         ${profile.followingCount}\n Following ',
                                  style: TextStyle(color: AppColors.text),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        
                          const RecipeDetailWidget(),
                        ],
                      ),
                    ),
                  ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
class ProfileHeaderDelegate extends SliverPersistentHeaderDelegate {
  final dynamic profile;

  ProfileHeaderDelegate({required this.profile});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    return Container(
      height: (maxExtent - shrinkOffset).clamp(minExtent, maxExtent),
      color: Theme.of(context).colorScheme.surfaceContainer,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 100 - (50 * percent),
            height: 100 - (50 * percent),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: profile.profilePhoto.isNotEmpty
                  ? Image.network(
                      profile.profilePhoto,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.person, size: 50),
                    )
                  : const Icon(Icons.person, size: 50),
            ),
          ),

          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    fontSize: 20 - (5 * percent),
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                  child: Text(profile.username),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: 1 - percent,
                  child: Text(
                    "@${profile.username}",
                    style: TextStyle(color: AppColors.text),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: 1 - percent,
                  child: Text(
                    profile.presentation,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 160.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
