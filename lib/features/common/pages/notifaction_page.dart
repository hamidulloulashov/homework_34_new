import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/common/widgets/bottom_navigator_widget.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(title: "Notifaction",arrow: "assets/arrow.png",),
      bottomNavigationBar: BottomNavigatorNews(),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            right: 36,
            left: 36,
          ),
          child: Column(
            children: [
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 355,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(14),
                          color: AppColors.container,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                      color: AppColors.white
                              ),
                              child: Image.asset("assets/star.png"),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Weekly New Recipes!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.text,
                                  ),
                                ),
                                Text(
                                  'Discover our new recipes of the week!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,

fontSize: 12,
                                    color: AppColors.text,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '2 Min Ago',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color:Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 355,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(14),
                          color: AppColors.container,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),
                              child: Image.asset("assets/notifaction.png", color: AppColors.text,)
                            ),
                            SizedBox(
                              width: 15,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Meal Reminder',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.text,
                                  ),
                                ),
                                Text(
                                  'Time to cook your healthy meal of the day',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: AppColors.text,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '35 Min Ago',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                                               color: Theme.of(context).colorScheme.inverseSurface,

                        ),
                      ),


],
                  ),
                ],
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wednesday',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                                            color: Theme.of(context).colorScheme.inverseSurface,

                    ),
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 355,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(14),
                          color: AppColors.container
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),
                              child:Image.asset("assets/notifaction.png")
                            ),
                            SizedBox(
                              width: 15,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'New update available',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.text,
                                  ),
                                ),
                                Text(
                                  'Performance improvements and bug fixes.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: AppColors.text,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '25 April 2024',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                                                color: Theme.of(context).colorScheme.inverseSurface,

                        ),
                      ),

                    ]
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 355,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(14),
                          color: AppColors.container,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),
                              child: Image.asset("assets/star.png")
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Reminder',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.text,
                                  ),
                                ),
                                Text(
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  'Don\'t forget to complete your profile to',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: AppColors.text,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '24 April 2024',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                                                color: Theme.of(context).colorScheme.inverseSurface,

                        ),
                      ),
                    ]
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 355,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(14),
                          color: AppColors.container,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),
                              child:Image.asset("assets/notifaction.png")
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Important Notice',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.text,
                                  ),
                                ),
                                Text(
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  'Remember to change your password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: AppColors.text,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '24 April 2024',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),

                    ]
                  ),
                ],
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Monday',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 355,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(14),
                          color: AppColors.container,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),
                              child: SvgPicture.asset(
                                'assets/Icons/notification-star.svg',
                                width: 27,
                                height: 27,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'New update available',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.text,
                                  ),
                                ),
                                Text(
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  ' to keep your account secure',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: AppColors.text,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '24 April 2024',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: AppColors.white,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}