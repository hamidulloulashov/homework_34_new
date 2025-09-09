import 'package:flutter/material.dart';

class RecipeButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textcolor;

  final String text;
  final VoidCallback? onPressed;
  const RecipeButton({
    super.key, required this.backgroundColor, required this.text, required this.onPressed, required this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

        backgroundColor: backgroundColor,

        fixedSize: Size(207, 45),


      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textcolor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
