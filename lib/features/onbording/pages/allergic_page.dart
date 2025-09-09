import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/data/repostories/onboarding_repostory.dart';
import 'package:homework_34/features/onbording/managers/alergic_view_model.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/core/client.dart';

class Allergic extends StatelessWidget {
  const Allergic({super.key});
  
  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient(); 
    final repository = OnboardingRepository(apiClient: apiClient);
    return ChangeNotifierProvider(
      create: (context) => AlergicViewModel(repository: repository),
      builder: (context, child) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "¿You have any allergic?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 30),
           Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Lorem ipsum dolor sit amet consectetur. Leo ornare\nullamcorper viverra ultrices in.",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Consumer<AlergicViewModel>(
                builder: (context, vm, child) {
                  if (vm.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }
                  if (vm.error != null) {
                    return Center(
                      child: Text(
                        vm.error!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: vm.allergic.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            vm.allergic[index].image,
                            width: 99,
                            height: 99,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          vm.allergic[index].title,
                          style:  TextStyle(color: Theme.of(context).colorScheme.inverseSurface,),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go('/home');
                  },
                  child: Container(
                    width: 162,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: AppColors.text,
                    ),
                    child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}