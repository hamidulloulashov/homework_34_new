import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/data/repostories/onboarding_repostory.dart';
import 'package:homework_34/features/onbording/managers/start_veiw_model.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/features/onbording/pages/second_page.dart';
import 'package:homework_34/core/client.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient();
    final repository = OnboardingRepository(apiClient: apiClient);

    return ChangeNotifierProvider(
      create: (_) => StartVeiwModel(repository: repository),
      builder: (context, child) => Scaffold(
        body: Consumer<StartVeiwModel>(
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
                  child: Image.network(vm.start[0].image, fit: BoxFit.cover),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).colorScheme.surface,
                          Colors.transparent,
                          Theme.of(context).colorScheme.surface,
                        ],
                        stops: const [0.2, 0.4, 1.0],
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 100,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get inspired",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Get inspired with our daily recipe recommendations.",
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
                          MaterialPageRoute(
                              builder: (_) => const SecondPage()),
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