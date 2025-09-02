import 'package:flutter/cupertino.dart';
import 'package:homework_34/core/utils/app_colors.dart';
class CommunityWidget extends StatefulWidget implements PreferredSizeWidget {
  const CommunityWidget({super.key});
  @override
  Size get preferredSize => Size(double.infinity, 40);
  @override
  State<CommunityWidget> createState() => _CommunityBottomBarState();
}
class _CommunityBottomBarState extends State<CommunityWidget> {
  List items = ['Top Recipes', 'Newest', 'Oldest'];
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            spacing: 35,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(items.length, (index) {
                return GestureDetector(
                  onTap: () {
                    isSelected = index;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 15,
                    ),
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: isSelected == index
                          ? AppColors.text
                          : AppColors.white
                    ),
                    child: Text(
                      items[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: isSelected == index
                            ? AppColors.white
                            : AppColors.text
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
