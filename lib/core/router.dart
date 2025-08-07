import 'package:go_router/go_router.dart';
import 'package:homework_34/core/rout_names.dart';
import 'package:homework_34/features/category.dart/pages/categories_page.dart';
import 'package:homework_34/features/category.dart/pages/details.dart';

class RouterClass {
  GoRouter router = GoRouter(
    initialLocation: RoutNames.categories,
    routes: <RouteBase>[
      GoRoute(
        path: RoutNames.categories,
        builder: (context, state) =>
            CategoriesPage(name: state.extra as String? ?? ''),
      ),
      GoRoute(
        path: RoutNames.details,
        name: RoutNames.details,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return DetailsPage(
            categoryId: extra['id'] as int,
            categoryName: extra['name'] as String,
          );
        },
      ),
    ],
  );
}
