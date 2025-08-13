// import 'package:flutter/material.dart';
// import 'package:homework_34/core/router.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final router = RouterClass().router;

//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       routerConfig: router,
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:homework_34/features/onbording/pages/pagveiw_page.dart';

// void main(List<String> args) {
//   runApp(const MyWidget());
// }

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: PagveiwPage());
//   }
// }

import 'package:flutter/material.dart';
import 'package:homework_34/core/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:homework_34/features/trending_news/pages/trending_recipes_page.dart';

// void main(List<String> args) {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: TrendingRecipesPage());
//   }
// }
