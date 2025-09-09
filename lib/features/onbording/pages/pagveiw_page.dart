import 'package:flutter/material.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
import 'package:homework_34/features/onbording/pages/allergic_page.dart';
import 'package:homework_34/features/onbording/pages/cooking_livel_page.dart';
import 'package:homework_34/features/onbording/pages/cuisins_page.dart';
import 'package:homework_34/features/onbording/pages/first_page.dart';
import 'package:homework_34/features/onbording/pages/second_page.dart';
import 'package:homework_34/features/onbording/pages/third_page.dart';
import '../widgets/proress_widget.dart';

class PagveiwPage extends StatefulWidget {
  const PagveiwPage({super.key});

  @override
  State<PagveiwPage> createState() => _PagveiwPageState();
}
class _PagveiwPageState extends State<PagveiwPage> {
  final PageController _controller = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bottom: currentPageIndex >= 3 
            ? ProgressBarWidget(currentStep: currentPageIndex - 2)
            : null,
      ),
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: [
          FirstPage(),      
          SecondPage(),     
          ThirdPage(),      
          CookingLivel(),   
          Cuisins(),        
          Allergic(),       
        ],
      ),
    );
  }
}