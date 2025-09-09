import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';
class SendCodeFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const SendCodeFormField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        maxLength: 1,

        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
        keyboardType: TextInputType.number,

        decoration: InputDecoration(
          filled: true,
          counterText: "",
          contentPadding: EdgeInsets.zero,
          fillColor: AppColors.container,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: AppColors.text),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: AppColors.text),
          ),
        ),
      ),
    );
  }
}
