import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/common/widgets/bottom_navigator_widget.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/features/floating_menu_profile/pages/notifaction_pages.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(arrow: 'assets/arrow.png',title: "Settings",),
      bottomNavigationBar: BottomNavigatorNews(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 25),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/notifaction_contair.png", width: 35, height: 35,),
                SizedBox(width: 20,),
                Text("Notification",style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface, fontWeight: FontWeight.w500, fontSize: 15),),
                SizedBox(width: 190,),
                GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotifactionPages()),
            );
          },
          child: Image.asset(
            "assets/pause.png",
            width: 12,
            height: 15,
          ),
        ),
              ],
              
            ),
            SizedBox(height: 20,),
                  Row(
              children: [
                Image.asset("assets/naushnik.png", width: 35, height: 35,),
                SizedBox(width: 20,),
                Text("Help Center",style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface, fontWeight: FontWeight.w500, fontSize: 15),),
                SizedBox(width: 190,),
                 Image.asset("assets/pause.png", width: 12, height: 15,),
              ],
              
            ),
            SizedBox(height: 20,),
                  Row(
              children: [
                Image.asset("assets/policy.png", width: 35, height: 35,),
                SizedBox(width: 20,),
                Text("Privacy Policy",style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface, fontWeight: FontWeight.w500, fontSize: 15),),
                SizedBox(width: 175,),
                 Image.asset("assets/pause.png", width: 12, height: 15,),
              ],
              
            ),
            SizedBox(height: 20,),
                  Row(
              children: [
                Image.asset("assets/language.png", width: 35, height: 35,),
                SizedBox(width: 20,),
                Text("Language",style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface, fontWeight: FontWeight.w500, fontSize: 15),),
                SizedBox(width: 203,),
                 Image.asset("assets/pause.png", width: 12, height: 15,),
              ],
              
            ),
            SizedBox(height: 20,),
                  Row(
              children: [
                Image.asset("assets/theme.png", width: 35, height: 35,),
                SizedBox(width: 20,),
                Text("Turn dark Theme",style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface, fontWeight: FontWeight.w500, fontSize: 15),),

              ],
              
            ),
            SizedBox(height: 20,),
                  Row(
              children: [
                Image.asset("assets/log_out.png", width: 35, height: 35,),
                SizedBox(width: 20,),
                Text("Log Out",style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface, fontWeight: FontWeight.w500, fontSize: 15),),
               
              ],
              
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text("Delete Account", style: TextStyle(color: AppColors.text, fontWeight: FontWeight.w500, fontSize: 15),),
            )

          ],
        ),
      ),
    );
  }
}