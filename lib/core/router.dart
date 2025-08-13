import 'package:go_router/go_router.dart';
import 'package:homework_34/features/auth/pages/login_page.dart';
import 'package:homework_34/features/auth/pages/register_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', name: 'login', builder: (context, state) => LoginPage()),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => RegisterPage(),
    ),
  ],
);
