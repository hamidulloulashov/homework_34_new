import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/core/router/routes.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import '../managers/theme_view_model.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final String? arrow;
  final String? first;
  final String? second;
  final Color? containerColor;
  final VoidCallback? onFirstPressed;
  final VoidCallback? onSecondPressed;
  final PreferredSizeWidget? bottom;
  final Widget? customWidget;
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.arrow,
    this.first,
    this.second,
    this.containerColor,
    this.onFirstPressed,
    this.onSecondPressed,
    this.bottom,
    this.customWidget,
  });
  @override
  Widget build(BuildContext context) {
    final isDark = context.select<ThemeViewModel, bool>((vm) => vm.isDark);

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      bottom: bottom,
      leading: arrow != null
          ? GestureDetector(
              onTap: () {
                if (Navigator.of(context).canPop()) Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(arrow!, width: 20, height: 20),
              ),
            )
          : null,
      title: title != null
          ? Center(
              child: Text(
                title!,
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : null,
      actions: [
        if (customWidget != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: customWidget!,
          ),
    



if (first != null)
  InkWell(
    onTap: () {
      if (first == "first") {
        GoRouter.of(context).push(Routes.notificationPages);
      } else {
        onFirstPressed?.call();
      }
    },
    child: Container(
      width: 28,
      height: 28,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: containerColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: first == "first"
            ? Image.asset("assets/notifaction.png", width: 18, height: 18)
            : Image.asset(first!, width: 18, height: 18),
        onPressed: null, 
      ),
    ),
  ),

        if (second != null)
          InkWell(
            onTap: () {
              if (second == "search") {
                _showSearchDialog(context);
              } else {
                onSecondPressed?.call();
              }
            },
            child: Container(
              width: 28,
              height: 28,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: containerColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: second == "search"
                    ? Image.asset("assets/search.png", width: 18,height: 18,)
                    : Image.asset(second!, width: 18, height: 18),
                onPressed: () {
                  if (second == "search") {
                    _showSearchDialog(context);
                  } else {
                    onSecondPressed?.call();
                  }
                },
              ),
            ),
          ),
        ...?actions,
        IconButton(
          icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
          onPressed: () => context.read<ThemeViewModel>().toggleTheme(),
        ),
      ],
    );
  }

  void _showSearchDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) {
        int activInd = -1;

        return Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                color: Colors.transparent,
                child: StatefulBuilder(
                  builder: (context, setStateDialog) {
                    return SingleChildScrollView( 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
               
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              filled: true,
                              fillColor: Colors.pink.shade50,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
          
                          
                          const Text(
                            "Recommended Recipes",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 12),
          
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: List.generate(recipe.length, (index) {
                              final isActive = activInd == index;
                              return GestureDetector(
                                onTap: () {
                                  setStateDialog(() {
                                    activInd = index;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? AppColors.text
                                        : AppColors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    recipe[index],
                                    style: TextStyle(
                                      color: isActive
                                          ? Colors.white
                                          : AppColors.text,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
          
                          const SizedBox(height: 20),
          
                          Row(
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade50,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.add,
                                    size: 18, color: Colors.pink),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Add Allergies",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
          
                          const SizedBox(height: 30),
          
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: SizedBox(
                              width: 207,
                              child: ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.text,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  "Search",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}

int activInd = 0;

List<String> recipe = [
  "Ceviche",
  "Hamburger",
  "Egg Rolls",
  "Wraps",
  "Cheesecake",
  "Tomato Soup",
  "Parfait",
  "Vegan",
  "Baked Salmon"
];
