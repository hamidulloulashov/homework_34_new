import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/data/repostories/home_repostory.dart';
import 'package:homework_34/features/home/managers/chef_view_model.dart';
import 'package:provider/provider.dart';

class ChefWidget extends StatelessWidget {
  const ChefWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = ChefViewModel(repository: Repository(apiClient: ApiClient()));
        vm.fetchChefs();
        return vm;
      },
      child: Consumer<ChefViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.error != null) {
            return Center(child: Text('Xato: ${vm.error}'));
          }
          if (vm.chef.isEmpty) {
            return const Center(child: Text("Ma'lumot topilmadi"));
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 280, bottom: 10),
                child: Text(
                  "Top Chef",
                  style: TextStyle(
                    color: AppColors.text,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vm.chef.length,
                  itemBuilder: (context, index) {
                    final chef = vm.chef[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 25 : 4,
                        right: index == vm.chef.length - 1 ? 25 : 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => GoRouter.of(context).push("/top_chefs"),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: chef.photo != null
                                  ? Image.network(
                                      chef.photo!,
                                      width: 83,
                                      height: 74,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Icon(Icons.error);
                                      },
                                    )
                                  : Container(
                                      width: 83,
                                      height: 74,
                                      color: Colors.grey.shade300,
                                      child: const Icon(
                                        Icons.person,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            chef.firstName,
                            style:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.inverseSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
