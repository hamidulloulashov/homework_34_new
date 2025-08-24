import 'package:flutter/material.dart';
import 'package:homework_34/data/repostories/onboarding_repostory.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import 'package:homework_34/features/onbording/managers/second_view_model.dart';
import 'package:homework_34/features/onbording/pages/third_page.dart';
import 'package:homework_34/core/client.dart';


class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient();
    final repository = OnboardingRepository(apiClient: apiClient);

    return ChangeNotifierProvider(
      create: (_) => SecondViewModel(repository: repository),
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.primary,
        body: Consumer<SecondViewModel>(
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

            return Stack(
              children: [
                Positioned.fill(
                  child: Image.network(vm.second[1].image, fit: BoxFit.cover),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary.withOpacity(1),
                          Colors.transparent,
                          AppColors.primary.withOpacity(1),
                        ],
                        stops: const [0.2, 0.4, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: Image.asset("assets/arrow.png", width: 30, height: 14),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 30,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Get an increase your skills",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Learn essential cooking techniques at your own pace.",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ThirdPage()),
                        );
                      },
                      child: Container(
                        width: 162,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: AppColors.container,
                        ),
                        child: const Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              color: AppColors.icons,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
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
