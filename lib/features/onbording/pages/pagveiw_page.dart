import 'package:flutter/material.dart';
import 'package:homework_34/features/onbording/pages/allergic_page.dart';
import 'package:homework_34/features/onbording/pages/cooking_livel_page.dart';
import 'package:homework_34/features/onbording/pages/cuisins_page.dart';
import 'package:homework_34/features/onbording/pages/first_page.dart';
import 'package:homework_34/features/onbording/pages/second_page.dart';
import 'package:homework_34/features/onbording/pages/third_page.dart';

class PagveiwPage extends StatelessWidget {
  PagveiwPage({super.key});
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
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

