import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/utils/app_colors.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( bottom: 20, left: 10),
      child: Row(
        children: [
          GestureDetector(
       onTap: () => GoRouter.of(context).push("/edit"),
            child: Container(
              width: 160,
              height: 27,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: AppColors.container),
              child: Center(child: Text("Edit Profile" , style: TextStyle(color: AppColors.text),)),
            ),
          ),
          SizedBox(width: 10,),
           GestureDetector(
                 onTap: () => GoRouter.of(context).push("/shared"),
             child: Container(
              width: 160,
              height: 27,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: AppColors.container),
              child: Center(child: Text("Share Profile" , style: TextStyle(color: AppColors.text),)),
                       ),
           )
        ],
      ),
    );
  }
}