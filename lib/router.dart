import 'package:ebike_flutter/bottomNavBar/bottomNavBar.dart';
import 'package:go_router/go_router.dart';

class Routers {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const BottomNavBar(),
      ),
    ],
  );
}
