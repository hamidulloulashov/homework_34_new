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

// import 'package:flutter/material.dart';
// import 'package:homework_34/core/router.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       routerConfig: router,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_34/data/models/trending_repostories_models/detail_model.dart';
import 'package:homework_34/features/trending_news/pages/trending_recipes_page.dart';
import 'package:homework_34/features/trending_news/widgets/detail_wedget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const TrendingRecipesPage(),
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          final detail = state.extra as DetailModel;
          return DetailPage(recipe: detail);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Trending News App',
      theme: ThemeData.light(),
      routerConfig: _router,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:homework_34/core/client.dart';
// import 'package:homework_34/core/router.dart';
// import 'package:homework_34/data/repostories/auth_respostory.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         Provider(create: (context) => ApiClient()),
//         Provider(create: (context) => AuthRepository(client: context.read())),
//       ],
//       child: MaterialApp.router(
//         debugShowCheckedModeBanner: false,
//         routerConfig: router,
//       ),
//     );
//   }
// }
