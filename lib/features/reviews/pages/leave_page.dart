import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/data/models/recipe/recipies_model.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/features/reviews/widgets/sucsefull_leave_widget.dart';
import 'package:homework_34/features/common/widgets/bottom_navigator_widget.dart';
class LeavePage extends StatefulWidget {
  final RecipeModel recipe;
  const LeavePage({super.key, required this.recipe});

  @override
  State<LeavePage> createState() => _LeavePageState();
}
class _LeavePageState extends State<LeavePage> {
  int _selectedRating = 0; 
    String selected = "No";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Leave A Review", arrow: "assets/arrow.png",),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [Container(
                width: 356,
                height: 262,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.text),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      widget.recipe.photo,
                      height: 206,
                      width: 356,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( top: 220),
                child: Center(
                  child: Text(
                                    widget.recipe.title,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                ),
              ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 105),
              child: Column(
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRating = index + 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Image.asset(
                            "assets/star.png",
                            color: index < _selectedRating
                                ? AppColors.text
                                : AppColors.textDark,
                          ),
                        ),
                      );
                    }
                    ),
                  ),
                  SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.only(right: 105),
              child: Text(
                "Your overall rating",
                style: TextStyle(color: AppColors.text, fontSize: 12),
              ),
            ),
                ],
              ),
            ),
            
            const SizedBox(height: 2),         
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Leave us Review!",
                hintStyle: const TextStyle(color: Colors.black38),
                filled: true,
                fillColor: AppColors.container,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                 width: 21,
                 height: 21,
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.container),
                 child: Icon(Icons.add, color: AppColors.text, size: 15,),
                ),
                SizedBox(width: 10,),
                Text("Add Photo", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.text),)
              ],
            ),
                const SizedBox(height: 24),
                      Text("Do you recommend this recipe?", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.text),),
                      SizedBox(height: 15,),
                  Row(
                    
                    children: [
                      GestureDetector(
          onTap: () {
            setState(() {
              selected = "No";
            });
          },
          child: Row(
            children: [
              Text(
                "No",
                style: TextStyle(color: AppColors.text),
              ),
              const SizedBox(width: 10),
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: selected == "No"
                      ? AppColors.text
                      : AppColors.icons, 
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 83),
        GestureDetector(
          onTap: () {
            setState(() {
              selected = "Yes";
            });
          },
          child: Row(
            children: [
              Text(
                "Yes",
                style: TextStyle(color: AppColors.text),
              ),
              const SizedBox(width: 10),
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: selected == "Yes"
                      ? AppColors.text
                      : AppColors.icons, 
                ),
              ),
            ],
          ),
        ),
                    ],
                  ),
                  SizedBox(height: 10,),
           Row(
            children: [
             Container(
              width: 168,
              height: 29,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: AppColors.container),
              child: Center(child: Text("cancel", style: TextStyle(color: AppColors.text, fontSize: 15),)),
             ),
             SizedBox(width: 12,),
                   Container(
  width: 168,
  height: 29,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(14),
    color: AppColors.text,
  ),
  child: InkWell(
    borderRadius: BorderRadius.circular(14),
   onTap: () {
  showDialog(
    context: context,
    barrierDismissible: true, 
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 60, vertical: 200), 
        child: const SucsefullLeaveWidget(),
      );
    },
  );
},

    child: const Center(
      child: Text(
        "Submit",
        style: TextStyle(color: AppColors.white, fontSize: 15),
      ),
    ),
  ),
)


            ],
           ),
           SizedBox(height: 30,),
  
          ],
        ),
      ),
         bottomNavigationBar: BottomNavigatorNews(),
    );
  }
}
