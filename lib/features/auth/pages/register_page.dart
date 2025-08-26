
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/client.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import 'package:homework_34/core/widgets/custom_appbar_widget.dart';
import 'package:homework_34/data/repostories/auth_respostory.dart';
import 'package:homework_34/features/auth/managers/register_veiw_model.dart';
import 'package:homework_34/features/auth/widgets/login_wedgte.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(
       repo: AuthRepository(client: ApiClient()),
      ),
      child: Consumer<RegisterViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: CustomAppBar(
              arrow: "assets/arrow.png",
              title: "Register",),
             
            
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      LoginWedgtes(
                        controller: _usernameController,
                        hint: "username",
                        text: "Username",
                      ),
                      const SizedBox(height: 12),
                      LoginWedgtes(
                        controller: _firstNameController,
                        hint: "John",
                        text: "First Name",
                      ),
                      const SizedBox(height: 12),
                      LoginWedgtes(
                        controller: _lastNameController,
                        hint: "Doe",
                        text: "Last Name",
                      ),
                      const SizedBox(height: 12),
                      LoginWedgtes(
                        controller: _emailController,
                        hint: "andrew@gmail.com",
                        text: "Email",
                      ),
                      const SizedBox(height: 12),
                      LoginWedgtes(
                        controller: _phoneNumberController,
                        hint: "+998970707007",
                        text: "Mobile number",
                      ),
                      const SizedBox(height: 12),
                      LoginWedgtes(
                        controller: _birthDateController,
                        hint: "DD/MM/YYYY",
                        text: "Date of Birth",
                      ),
                      const SizedBox(height: 12),
                      LoginWedgtes(
                        controller: _passwordController,
                        hint: "********",
                        text: "Password",
                        isPassword: true,
                      ),
                      const SizedBox(height: 12),
                      LoginWedgtes(
                        controller: _confirmController,
                        hint: "********",
                        text: "Confirm Password",
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "By continuing, you agree to\nTerms of Use and Privacy Policy.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.white),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.text,
                            fixedSize: const Size(195, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23),
                            ),
                          ),
                          onPressed: viewModel.loading
                              ? null
                              : () async {
                                  if (_formKey.currentState!.validate()) {
                                    if (_passwordController.text !=
                                        _confirmController.text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text("Passwords do not match"),
                                        ),
                                      );
                                      return;
                                    }

                                    await viewModel.register(
                                      username: _usernameController.text,
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                      email: _emailController.text,
                                      phoneNumber: _phoneNumberController.text,
                                      birthDate: _birthDateController.text,
                                      password: _passwordController.text,
                                      context: context,
                                    );

                                    if (viewModel.isSuccess) {
                                      await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text("Salom"),
                                            content: const Text(
                                              "Ro'yxatdan o'tish muvaffaqiyatli!",
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  context.go('/onboarding');
                                                },
                                                child: const Text("OK"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else if (viewModel.errorMessage != null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              "Error: ${viewModel.errorMessage}"),
                                        ),
                                      );
                                    }
                                  }
                                },
                          child: viewModel.loading
                              ? const CircularProgressIndicator(
                                  color: AppColors.white,
                                )
                              : Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(color: AppColors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Login in",
                              style: TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
