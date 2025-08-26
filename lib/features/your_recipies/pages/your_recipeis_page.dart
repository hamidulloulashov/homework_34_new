import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import 'package:homework_34/core/widgets/custom_appbar_widget.dart';
import 'package:homework_34/core/widgets/bottom_navigator_widget.dart';
import 'package:homework_34/core/widgets/favourite_widget.dart';
import 'package:homework_34/features/your_recipies/managers/your_recipeis_veiw_model.dart';
import 'package:provider/provider.dart';
class YourRecipeisPage extends StatelessWidget {
  const YourRecipeisPage({super.key});
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<YourRecipeisVeiwModel>();

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return Center(child: Text("Xatolik: ${viewModel.error}"));
    }

    if (viewModel.recipes.isEmpty) {
      return const Center(child: Text("Hech qanday recipe topilmadi"));
    }
    return Scaffold(
      appBar: CustomAppBar(arrow: 'assets/arrow.png',first: 'assets/notifaction.png',second: 'assets/search.png',containerColor: AppColors.container,),
      body: Column(
        children: [
          Container(
  height: 255,
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: AppColors.text,
  ),
  padding:  EdgeInsets.all(12),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text("Most Viewed Today",style: TextStyle(color: AppColors.white, fontSize: 15, fontWeight: FontWeight.bold),),
      ), 
      Expanded(
        child: Row(
          children: List.generate(
            viewModel.recipes.length.clamp(0, 2), 
            (index) {
              final recipe = viewModel.recipes[index];
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: index == 0 ? 12 : 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Card(
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                  child: Image.network(
                                    recipe.photo,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        const Icon(Icons.image_not_supported),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(bottom: 10, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      recipe.title,
                                      style:  TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                         color: Theme.of(context).colorScheme.inverseSurface,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        
                                        Text(
                                          "${recipe.rating}",
                                          style: const TextStyle(fontSize: 12, color: AppColors.text),
                                        ),
                                         const SizedBox(width: 5),
                                        Image.asset("assets/star.png", width: 12),
                                          const SizedBox(width: 20),
                                        Image.asset("assets/alarm.png", width: 12),
                                        const SizedBox(width: 5),
                                        Text(
                                          "${recipe.timeRequired} min",
                                          style: const TextStyle(fontSize: 12, color: AppColors.text),
                                        ),
                                      
                                       
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Positioned(
                            right: 8,
                            top: 8,
                            child: FavouriteWidget(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ],
  ),
),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: viewModel.recipes.length > 2
                  ? viewModel.recipes.length - 2
                  : 0,
              itemBuilder: (context, index) {
                final recipe = viewModel.recipes[index + 2];
                return _GridRecipeCard(recipe: recipe);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigatorNews(),
    );
  }
}

class _TopRecipeCard extends StatelessWidget {
  final dynamic recipe;
  const _TopRecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(recipe.photo),
          fit: BoxFit.cover,
        
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(12),
      child: Text(
        recipe.title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          shadows: [
            Shadow(blurRadius: 6, color: Colors.black54, offset: Offset(0, 2))
          ],
        ),
      ),
    );
  }
}
class _GridRecipeCard extends StatelessWidget {
  final dynamic recipe;
  const _GridRecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Stack(
                children: [Image.network(
                  recipe.photo,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 60),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130, top: 5),
                  child: FavouriteWidget(),
                ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                          recipe.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(fontSize: 12),
                        ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                     Image.asset("assets/alarm.png", width: 10,),
                     SizedBox(width: 5,),
                     Text("${recipe.timeRequired} min", style: TextStyle(color: AppColors.text),),
                     SizedBox(width: 45,),
                     Image.asset("assets/star.png", width: 10,),
                     SizedBox(width: 5,),
                     Text("${recipe.rating}", style: TextStyle(color: AppColors.text),)
                    ],
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
