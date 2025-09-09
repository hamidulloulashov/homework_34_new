import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/utils/app_colors.dart' show AppColors;
import 'package:homework_34/data/repostories/profile_repostory.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/features/profile/managers/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SharedProfile extends StatelessWidget {
  const SharedProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        arrow: "assets/arrow.png",
      ),
      body: ChangeNotifierProvider(
        create: (context) {
          final vm = ProfileViewModel(
  profileRepostory: ProfileRepostory(apiClient: ApiClient()),
);
          vm.fetchProfile();
          return vm;
        },
        child: Consumer<ProfileViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (vm.error != null) {
              return Center(
                child: Text('Error: ${vm.error}'),
              );
            }

            final profile = vm.profile;
            if (profile == null) {
              return const Center(
                child: Text('Profile not found'),
              );
            }

            return Column(
              children: [
                const SizedBox(height: 160),
                Container(
                  width: 362,
                  height: 378.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white,
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          '@${profile.username}',
                          style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25,top: 40),
                        child: QrImageView(
                          data: profile.username,
                          version: QrVersions.auto,
                          size: 280,
                          foregroundColor: AppColors.text,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 115,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Theme.of(context).colorScheme.inverseSurface,
                          ),
                          child: const Text(
                            'Share profile',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.text,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 115,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                           
                          ),
                          child: const Text(
                            'Copy link',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.text,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 115,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                           
                          ),
                          child: const Text(
                            'Download',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.text,
                            ),
                          ),
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
