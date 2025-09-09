import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';

class RecipeTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final String label;
  final TextEditingController controller;

  const RecipeTextField({
    super.key,
    required this.hintText,
    this.isPassword = false, required this.label, required this.controller,
  });

  @override
  State<RecipeTextField> createState() => _RecipeTextFieldState();
}
class _RecipeTextFieldState extends State<RecipeTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface,fontSize: 15),),
SizedBox(height: 10,),
        SizedBox(
          width: 357,
          height: 41,
          child: TextFormField(
            controller: widget.controller, 
            obscureText: widget.isPassword ? obscureText : false,
            decoration: InputDecoration(
              filled: true,
              fillColor:AppColors.container,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: AppColors.text,),
                
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
                
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.text,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
