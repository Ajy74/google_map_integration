import 'package:go_router/go_router.dart';
import 'package:google_map_integration/views/home_sceen.dart';

class AppRoute {

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomeScreen(),
      ),
    ]
  );

}