import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import 'package:homework_34/data/models/top_chefs_models/most_model.dart';
import 'package:homework_34/data/models/top_chefs_models/recipies_model.dart';
import 'package:homework_34/features/trending_news/widgets/bottom_navigator_widget.dart';
import 'package:homework_34/features/trending_news/widgets/favourite_widget.dart';
import 'package:provider/provider.dart';
import '../managers/most_view_top_chef_model.dart';

class ChefDetail extends StatefulWidget {
  final int id;
  final String username;
  const ChefDetail({super.key, required this.id, required this.username});

  @override
  State<ChefDetail> createState() => _ChefDetailState();
}

class _ChefDetailState extends State<ChefDetail> {
  @override
  void initState() {
    context.read<MostViewTopChefModel>().loadChefDetails(widget.id);
    context.read<MostViewTopChefModel>().loadRecipes(widget.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: AppColors.text),
        ),
        actions: [
             Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: AppColors.container,
              shape: BoxShape.circle,
            ),
            child:IconButton(
  padding: EdgeInsets.zero,
  icon: Image.asset("assets/bluts.png", width: 20, height: 20),
onPressed: () {
  final MostModel chef = context.read<MostViewTopChefModel>().chefDetails.first;
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            width: 431,
            height: 253,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 63,
                        height: 63,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(chef.profilePhoto),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(widget.username,
                          style: TextStyle(color: AppColors.text)),
                    ],
                  ),
                  SizedBox(height:20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Text("Copy Profile URL", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                        SizedBox(height: 20,),
                         Text("Share this Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          );
        },
      );
    },
  );
},
            ),


          ),
           Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: AppColors.container,
              shape: BoxShape.circle,
            ),
            child:IconButton(
  padding: EdgeInsets.zero,
  icon: SvgPicture.asset("assets/third.svg", width: 20, height: 20),
onPressed: () {
  final MostModel chef = context.read<MostViewTopChefModel>().chefDetails.first;

  bool muteNotifications = false;
  bool muteAccount = false;
  bool blockAccount = false;

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            width: 431,
            height: 373,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 63,
                        height: 63,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(chef.profilePhoto),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(widget.username,
                          style: TextStyle(color: AppColors.text)),
                    ],
                  ),
                  SizedBox(height:20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("Manage notifications", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                  ),
                  SizedBox(height: 5),
                  SwitchListTile(
                    title: Text("Mute notifications"),
                     activeColor: AppColors.text,
                    value: muteNotifications,
                    onChanged: (val) {
                      setState(() => muteNotifications = val);
                    },
                  ),
                  SwitchListTile(
                    title: Text("Mute Account"),
                    activeColor: AppColors.text,
                    value: muteAccount,
                    onChanged: (val) {
                      setState(() => muteAccount = val);
                    
                    },
                  ),
                  SwitchListTile(
                    title: Text("Block Account"),
                     activeColor: AppColors.text,
                     
                    value: blockAccount,
                    onChanged: (val) {
                      setState(() => blockAccount = val);
                    },
                  ),
                  ListTile(
                    title: Text("Report"),
                    onTap: () {
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
},
            ),


          ),
        ],
        title: Text(
          "${widget.username}",
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<MostViewTopChefModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.text),
            );
          }

          if (vm.errorMessage != null) {
            return Center(
              child: Text(
                vm.errorMessage!,
                style: TextStyle(color: AppColors.text),
              ),
            );
          }

          if (vm.chefDetails.isEmpty) {
            return Center(
              child: Text(
                "No details found.",
                style: TextStyle(color: AppColors.text),
              ),
            );
          }

          final MostModel chef = vm.chefDetails.first;

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(chef.profilePhoto),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${chef.firstName} ${chef.lastName}-Chef",
                              style: TextStyle(
                                color: AppColors.text,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              chef.presentation,
                              style: TextStyle(
                                color: AppColors.text.withOpacity(0.7),
                                fontSize: 13,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.container,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "Following",
                                style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.container),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatItem("${chef.recipesCount}", "recipes"),
                      _buildDivider(),
                      _buildStatItem("${chef.followingCount}", "Following"),
                      _buildDivider(),
                      _buildStatItem(
                        _formatNumber(chef.followerCount),
                        "Followers",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Recipes",
                        style: TextStyle(
                          color: const Color(0xFFFF6B6B),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 2,
                        width: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6B6B),
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: vm.recipes.isEmpty
                      ? Container(
                          height: 200,
                          child: Center(
                            child: Text(
                              "No recipes found",
                              style: TextStyle(
                                color: AppColors.text.withOpacity(0.6),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 0.75,
                              ),
                          itemCount: vm.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = vm.recipes[index];
                            return _buildRecipeCard(recipe);
                          },
                        ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigatorNews(),
    );
  }

  Widget _buildRecipeCard(RecipeModel recipe) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(recipe.photo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 135, top: 7),
                  child: FavouriteWidget(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    recipe.description,
                    style: TextStyle(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            recipe.rating.toStringAsFixed(1),
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.timer, color: AppColors.text, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            "${recipe.timeRequired}m",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: AppColors.white, fontSize: 12)),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 30,
      color: AppColors.white.withOpacity(0.5),
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return "${(number / 1000000).toStringAsFixed(1)}M";
    } else if (number >= 1000) {
      return "${(number / 1000).toStringAsFixed(1)}K";
    }
    return number.toString();
  }
}
