import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/data/repostories/onboarding_repostory.dart';
import 'package:homework_34/features/onbording/managers/cusins_view_model.dart';
import 'package:homework_34/features/onbording/widgets/proress_widget.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/core/client.dart';

class Allergic extends StatelessWidget {
  const Allergic({super.key});
  
  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient(); 
    final repository = OnboardingRepository(apiClient: apiClient);
    
    return ChangeNotifierProvider(
      create: (context) => CusinsViewModel(repository: repository),
      builder: (context, child) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProgressBarWidget(currentStep: 3),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "¿You have any allergic?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Lorem ipsum dolor sit amet consectetur. Leo ornare\nullamcorper viverra ultrices in.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Consumer<CusinsViewModel>(
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
                    itemCount: vm.cusins.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            vm.cusins[index].image,
                            width: 99,
                            height: 99,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          vm.cusins[index].title,
                          style: const TextStyle(color: Colors.white),
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