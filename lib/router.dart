import 'package:go_router/go_router.dart';
import 'package:photo_library/ui/detail/detail_screen.dart';
import 'package:photo_library/ui/main/main_screen.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => MainScreen()
    ),
    GoRoute(
        path: '/detail',
        builder: (context, state) => DetailScreen()
    ),
  ],
);
