import 'package:flutter/material.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/data/repostories/profile_repostory.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/features/profile/managers/profile_view_model.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = ProfileViewModel(
          profileRepostory: ProfileRepostory(apiClient: ApiClient()),
        );
        vm.fetchProfile();
        return vm;
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          arrow: "assets/arrow.png",
          title: "Edit Profile",
        ),
        body: Consumer<ProfileViewModel>(
          builder: (context, vm, _) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (vm.error != null) {
              return Center(child: Text("Error: ${vm.error}"));
            }
            final profile = vm.profile;
            if (profile == null) {
              return const Center(child: Text("Profile not found"));
            }

            final usernameController =
                TextEditingController(text: profile.username);

            final nameController = TextEditingController();
            final presentationController = TextEditingController();
            final linkController = TextEditingController();

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              NetworkImage(profile.profilePhoto.isNotEmpty
                                  ? profile.profilePhoto
                                  : "https://via.placeholder.com/150"),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Edit Photo",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildField(context, "Name", nameController),
                  const SizedBox(height: 16),

                  _buildField(context, "Username", usernameController),
                  const SizedBox(height: 16),

                  _buildField(context, "Presentation", presentationController,
                      maxLines: 3),
                  const SizedBox(height: 16),

                  _buildField(context, "Add Link", linkController),
                  const SizedBox(height: 30),
                  SizedBox(height: 30,),
                  SizedBox(
                    width: 152,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Profile saved successfully")),
                        );
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildField(
    BuildContext context,
    String label,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inverseSurface,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.container,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}
