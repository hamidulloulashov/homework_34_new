import 'package:flutter/material.dart';
import 'package:homework_34/features/following/widgets/followers_widget.dart';
import 'package:homework_34/features/following/widgets/following_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../common/widgets/bottom_navigator_widget.dart';
import '../../common/widgets/custom_appbar_widget.dart';

class FollowingAndFollowersPage extends StatelessWidget {
  const FollowingAndFollowersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: BottomNavigatorNews(),
        appBar: CustomAppBar(
          title: "@andrew",
          arrow: "assets/arrow.png",
          bottom: const TabBar(
            tabs: [
              Tab(text: "Following"),
              Tab(text: "Followers"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                width: 355,
                height: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: AppColors.container,
                ),
                child: TextField(
                  style: TextStyle(color: AppColors.text, fontSize: 14),
                  cursorColor: AppColors.text,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: AppColors.text),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 12, bottom: 15),
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppColors.text,
                      size: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  children: [
                    FollowingWidget(),
                    FollowersWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
