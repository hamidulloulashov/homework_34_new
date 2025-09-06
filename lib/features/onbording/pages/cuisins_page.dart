import 'package:flutter/material.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/data/repostories/onboarding_repostory.dart';
import 'package:homework_34/features/onbording/widgets/proress_widget.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/onbording/managers/cusins_view_model.dart';
import 'package:homework_34/features/onbording/pages/allergic_page.dart';
import 'package:homework_34/core/client.dart';

class Cuisins extends StatelessWidget {
  const Cuisins({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient();
    final repository = OnboardingRepository(apiClient: apiClient);

    return ChangeNotifierProvider(
      create: (_) => CusinsViewModel(repository: repository),
      builder: (context, child) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProgressBarWidget(currentStep: 2),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Select your cuisines preferences",
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
                "Please select your cuisines preferences for a\nbetter recommendations or you can skip it.",
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
                      childAspectRatio: 0.90,
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
                        const SizedBox(height: 5),
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
                Container(
                  width: 162,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: AppColors.container,
                  ),
                  child: Center(
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: AppColors.text,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Allergic()),
                    );
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
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}