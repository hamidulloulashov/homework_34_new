import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/auth/widgets/forgot_widget.dart';
import 'package:homework_34/features/auth/widgets/login_wedgte.dart';
import 'package:homework_34/features/auth/widgets/recipe_button_widget.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';

class ForgotFrist extends StatelessWidget {
  const ForgotFrist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Forgot your password",
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: ForgotWidget(textmain: "Hello there!", textdetail: "Enter your email address. We will send a code\nverification in the next step."),
        
              
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: LoginWedgtes(hint: "example@example.com",text: "email",),
            ),
            
        Padding(
          padding: const EdgeInsets.only(top:405),
          child: RecipeButton(backgroundColor: AppColors.container, text: "Continue", onPressed: (){
            GoRouter.of(context).push("/forgot");
          }, textcolor:AppColors.text),
        )
          ],
        ),
      ),
    );
  }
}