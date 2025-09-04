import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/common/widgets/bottom_navigator_widget.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';

class NotifactionPages extends StatefulWidget {
  const NotifactionPages({super.key});

  @override
  State<NotifactionPages> createState() => _NotifactionPagesState();
}

class _NotifactionPagesState extends State<NotifactionPages> {
  bool muteNotifications = false; 
  bool sound = false;
  bool call = false;
  bool vibrate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigatorNews(),
      appBar: CustomAppBar(
        arrow: "assets/arrow.png",
        title: "Notification",
      ),
      body: Padding(
        padding: const EdgeInsets.only( top: 10),
        child: Column(
          children: [
            Row(
              children: [
                
                Expanded(
  child: Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "General Notification",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        Transform.scale(
          scale: 0.7, 
          child: Switch(
            value: muteNotifications,
            activeColor: AppColors.text,
            onChanged: (val) {
              setState(() => muteNotifications = val);
            },
          ),
        ),
      ],
    ),
  ),
)
,
                
              ],
            ),
                 Row(
              children: [
                
                Expanded(
  child: Padding(
    padding: const EdgeInsets.only(left: 20, top:10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Sound",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        Transform.scale(
          scale: 0.7, 
          child: Switch(
            value: sound,
            activeColor: AppColors.text,
            onChanged: (val) {
              setState(() => sound = val);
            },
          ),
        ),
      ],
    ),
  ),
)
,
              ],
            ),
                 Row(
              children: [
                
                Expanded(
  child: Padding(
    padding: const EdgeInsets.only(left: 20, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Sound Call",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        Transform.scale(
          scale: 0.7, 
          child: Switch(
            value: call,
            activeColor: AppColors.text,
            onChanged: (val) {
              setState(() => call = val);
            },
          ),
        ),
      ],
    ),
  ),
)
,
         
              ],
            ),
                 Row(
              children: [
                
                Expanded(
  child: Padding(
    padding: const EdgeInsets.only(left: 20,top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Vibrate",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        Transform.scale(
          scale: 0.7, 
          child: Switch(
            value: vibrate,
            activeColor: AppColors.text,
            onChanged: (val) {
              setState(() => vibrate = val);
            },
          ),
        ),
      ],
    ),
  ),
)
,
            
              ],
            ),
          ],
        ),
      ),
    );
  }
}
