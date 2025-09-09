import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/auth/widgets/forgot_widget.dart';
import 'package:homework_34/features/auth/widgets/recipe_button_widget.dart';
import 'package:homework_34/features/auth/widgets/send_widget.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
class ForgotPassword extends StatefulWidget {
  final int otpLength = 6;
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordPageState();
}
class _ForgotPasswordPageState extends State<ForgotPassword> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;
  late int timeSeconder;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      widget.otpLength,
      (_) => TextEditingController(),
    );
    focusNodes = List.generate(widget.otpLength, (_) => FocusNode());

    _startTimer();
  }
  void _startTimer() {
    timeSeconder = 60;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeSeconder > 0) {
        setState(() {
          timeSeconder--;
        });
      } else {
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    for (var i in controllers) {
      i.dispose();
    }
    for (var i in focusNodes) {
      i.dispose();
    }
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Forgot Your Password",
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 37.0, right: 37, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ForgotWidget(
              textmain: "Youve got mail",
              textdetail:
                  "We will send you the verification code to your email address, check your email and put the code right below.",
            ),
            SizedBox(height: 53),
            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.otpLength, (index) {
                return SendCodeFormField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  onChanged: (value) {
                    if (value.isNotEmpty && index < widget.otpLength - 1) {
                      FocusScope.of(
                        context,
                      ).requestFocus(focusNodes[index + 1]);
                    }
                    if (value.isEmpty && index > 0) {
                      FocusScope.of(
                        context,
                      ).requestFocus(focusNodes[index - 1]);
                    }
                  },
                );
              }),
            ),
            SizedBox(height: 75),
            Center(
              child: timeSeconder > 0
                  ? SizedBox(
                      width: 176,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Didn’t receive the mail? You can resend it in $timeSeconder sec",
                        style: TextStyle(
                        
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: _startTimer,
                      child: Text(
                        "Resend Code",
                        style: TextStyle(color: AppColors.text),

                      ),
                    ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: RecipeButton(
                  backgroundColor: AppColors.container,
                  text: 'Continue',
                  onPressed: () {
                  GoRouter.of(context).push("/forgot2");
                  },
                  textcolor: AppColors.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
