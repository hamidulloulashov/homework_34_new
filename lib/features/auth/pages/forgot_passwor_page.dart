import 'package:flutter/material.dart';
import 'package:homework_34/features/auth/widgets/forgot_widget.dart';
import 'package:homework_34/features/auth/widgets/text_feld_widget.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/features/auth/widgets/sucsefull_widget.dart'; 
import 'package:homework_34/core/utils/app_colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: SizedBox(
            width: 250,
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: const SucsefullWidget()),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Create a new password",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ForgotWidget(
              textmain: "Create a new password",
              textdetail:
                  "Enter your new password. If you forgot it then you have\n"
                  "to do the step of forgot password.",
            ),
            const SizedBox(height: 20),
            RecipeTextField(
              hintText: "*********",
              label: "New Password",
              isPassword: true,
              controller: newPasswordController,
            ),
            const SizedBox(height: 16),
            RecipeTextField(
              hintText: "*********",
              label: "Confirm Password",
              isPassword: true,
              controller: confirmPasswordController,
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 207,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    final newPass = newPasswordController.text.trim();
                    final confirmPass = confirmPasswordController.text.trim();

                    if (newPass.isEmpty || confirmPass.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please fill in all fields")),
                      );
                    } else if (newPass != confirmPass) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Passwords do not match")),
                      );
                    } else {
                      _showSuccessDialog(); 
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    
                    backgroundColor: AppColors.container,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                  child: Center(
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
