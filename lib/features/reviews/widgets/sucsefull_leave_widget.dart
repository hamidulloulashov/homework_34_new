import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/theme/colors.dart';

class SucsefullLeaveWidget extends StatelessWidget {
  const SucsefullLeaveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 286,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text(
            "Thank you for\nyour Review!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Stack(
            children: [
                   Image.asset("assets/ramka.png" ,width: 60,height: 60,),
                   Padding(
                     padding: const EdgeInsets.only(left: 15,top: 15),
                     child: Image.asset("assets/good.png", width: 32,height: 27,),
                   )
            ],
          ),
          
          Text(
            "Lorem ipsum dolor sit \namet pretium cras id dui\npellentesque ornare.",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30,),
          Container(
              width: 207,
              height: 45,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), color: AppColors.text),
              child: Center(child: Text("Go to home", style: TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w600),)),
             ),
        ],
      ),
    );
  }
}
