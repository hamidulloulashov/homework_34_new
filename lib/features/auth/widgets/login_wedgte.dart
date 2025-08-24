import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/colors.dart';

class LoginWedgtes extends StatefulWidget {
  final String hint;
  final String text;
  final bool isPassword;
  final TextEditingController? controller;

  const LoginWedgtes({
    super.key,
    required this.hint,
    required this.text,
    this.isPassword = false,
    this.controller,
  });

  @override
  State<LoginWedgtes> createState() => _RecipiTextFormState();
}

class _RecipiTextFormState extends State<LoginWedgtes> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text, style: TextStyle(color: Colors.white)),
        SizedBox(height: 8),
        SizedBox(
          width: 357,
          height: 41,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscure : false,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.container,
              hintText: widget.hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
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
