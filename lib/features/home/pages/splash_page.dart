import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/lokal_data_storege/token_storage.dart';
import 'package:homework_34/core/utils/app_colors.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkTokenAndNavigate();
  }
  Future<void> _checkTokenAndNavigate() async {
    final token = await TokenStorage.getToken();
    await Future.delayed(const Duration(seconds: 4));

    if (token != null && token.isNotEmpty) {
      if (mounted) context.go('/home');
    } else {
      if (mounted) context.go('/login');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.text,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 153,
              height: 153,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(76.5),
                color: AppColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/knef.png", width: 16, height: 92),
                  const SizedBox(width: 5),
                  Image.asset("assets/fork.png", width: 19, height: 90),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "DishDash",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
