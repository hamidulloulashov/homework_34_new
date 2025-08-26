import 'package:flutter/material.dart';
import 'package:homework_34/core/widgets/custom_appbar_widget.dart';
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
       appBar: CustomAppBar(arrow: 'assets/arrow.png',),
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
                          Theme.of(context).colorScheme.surface,
                          Colors.transparent,
                           Theme.of(context).colorScheme.surface,
                        ],
                        stops: const [0.2, 0.4, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        "Get an increase your skills",
                        style: TextStyle(
                           color: Theme.of(context).colorScheme.inverseSurface,
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Learn essential cooking techniques at your own pace.",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
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
