import 'package:flutter/material.dart';
class ForgotWidget extends StatelessWidget {
  final String textmain;
  final String textdetail;

  const ForgotWidget({
    super.key,
    required this.textmain,
    required this.textdetail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          textmain,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inverseSurface,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 20,
        ),

        SizedBox(
          width: 330,
          child: Text(
            textdetail,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inverseSurface,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
