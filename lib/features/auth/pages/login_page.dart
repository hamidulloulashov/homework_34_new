import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import 'package:homework_34/data/repostories/auth_respostory.dart';
import 'package:homework_34/features/auth/managers/login_veiw_model.dart';
import 'package:homework_34/features/auth/widgets/login_wedgte.dart';
import 'package:homework_34/core/client.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(
        repo: AuthRepository(client: context.read<ApiClient>()),
      ),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: AppColors.primary,
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              title: const Text(
                "Login",
                style: TextStyle(color: AppColors.text),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      LoginWedgtes(
                        controller: _loginController,
                        hint: "andrew@gmail.com",
                        text: "Email",
                      ),
                      const SizedBox(height: 12),
                      LoginWedgtes(
                        controller: _passwordController,
                        hint: "********",
                        text: "Password",
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 85),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 100, top: 100),
                          child: Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.container,
                                  fixedSize: const Size(207, 45),
                                ),
                                onPressed: viewModel.loading
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          viewModel.login(
                                            login: _loginController.text,
                                            password: _passwordController.text,
                                          );
                                        }
                                      },
                                child: viewModel.loading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Login in",
                                        style: TextStyle(
                                          color: AppColors.text,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.container,
                                  fixedSize: const Size(207, 45),
                                ),
                                onPressed: () {
                                  context.push('/register');
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: AppColors.text,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 50),
                              const Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 50),
                              const Text(
                                "or sign up with",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/instagram.png",
                                      width: 26,
                                    ),
                                    const SizedBox(width: 10),
                                    Image.asset("assets/google.png", width: 26),
                                    const SizedBox(width: 10),
                                    Image.asset(
                                      "assets/facbook.png",
                                      width: 26,
                                    ),
                                    const SizedBox(width: 10),
                                    Image.asset("assets/watsap.png", width: 26),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                "Dont have an account? Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
