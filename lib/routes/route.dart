import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_map_integration/page_not_found.dart';
import 'package:google_map_integration/views/home_sceen.dart';
import 'package:google_map_integration/views/marker_screen.dart';

class AppRoute {

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomeScreen(),
        routes: [
          //~ we can like this also without using more slash(/) ...as a child routes
          GoRoute(
            path: "404",
            builder: (context, state) => const PageNotFoundScreen(),
          ),

          GoRoute(
            path: "marker",
            builder: (context, state) => const MarkerScreen(),
          ),
        ]
      ),

      // GoRoute(
      //   path: "/marker",
      //   builder: (context, state) => const MarkerScreen(),
      // ),
      // GoRoute(
      //   path: "/404",
      //   builder: (context, state) => const PageNotFoundScreen(),
      // ),
    ],
    
    onException: (_, GoRouterState state, GoRouter router) {
      router.go('/404', extra: state.uri.toString());
    },
  );

}