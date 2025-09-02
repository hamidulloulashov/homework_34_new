import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework_34/core/utils/app_colors.dart';

class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({super.key});

  @override
  State<FavouriteWidget> createState() => _TwoContainersFavoriteIconState();
}

class _TwoContainersFavoriteIconState extends State<FavouriteWidget> {
  bool isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavorited = !isFavorited;
        });
      },
      child: isFavorited
          ? Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.text,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(
                'assets/favourite.svg',
                color: AppColors.white,
              ),
            )
          : Container(
              width: 28,
              decoration: BoxDecoration(
                color: AppColors.container,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(
                'assets/favourite.svg',
                color: AppColors.icons,
              ),
            ),
    );
  }
}
