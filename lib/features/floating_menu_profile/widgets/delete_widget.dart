import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/utils/app_colors.dart';

class DeleteWidget extends StatelessWidget {
  const DeleteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 431,
      height: 215,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text(
            "Delete account",
            style: TextStyle(
              color: AppColors.text,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20,),
          Text("Are you sure you want\nto delete account?", style: TextStyle(color: Colors.black),),
         Padding(
           padding: const EdgeInsets.only(left: 50, top: 60),
           child: Row(
            children: [
               GestureDetector(
                onTap: () => GoRouter.of(context).push("/settings"),
                 child: Container(
                               width: 140,
                               height: 26,
                               decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(41),
                  color: AppColors.container,
                               ),
                               child: Center(child: Text("cancel", style: TextStyle(color: AppColors.text),))
                             ),
               ),
            SizedBox(width:  5,),
                 GestureDetector(
                  onTap: () => GoRouter.of(context).push("/splash"),
                   child: Container(
                                 width: 140,
                                 height: 26,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(41),
                                   color: AppColors.container,
                                 ),
                                 child: Center(child: Text("Yes, Delet Account", style: TextStyle(color: AppColors.text),))
                               ),
                 ),
            ],
           ),
         )
        ],
      ),
    );
  }
}
