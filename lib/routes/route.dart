import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_map_integration/page_not_found.dart';
import 'package:google_map_integration/views/add_marker_icon.dart';
import 'package:google_map_integration/views/address_conversion_screen.dart';
import 'package:google_map_integration/views/google_search_places.dart';
import 'package:google_map_integration/views/home_sceen.dart';
import 'package:google_map_integration/views/location_mover_screen.dart';
import 'package:google_map_integration/views/marker_screen.dart';

class AppRoute {

  static final bool isLogged = false;

  static final GoRouter router = GoRouter(

    redirect: (context, state) {
      if(isLogged){
        return "/";
      }
      else{
        return "/404";
      }
    },

    routes: [
      GoRoute(
        name: 'home',
        path: "/",
        builder: (context, state) => const HomeScreen(),
        routes: [
          //~ we can like this also without using more slash(/) ...as a child routes
          GoRoute(
            path: "404",
            builder: (context, state) => PageNotFoundScreen(
              error: state.error as String? ?? '',
            ),
          ),

          GoRoute(
            name: 'marker',
            path: "marker",
            builder: (context, state) => const MarkerScreen(),
          ),

          GoRoute(
            name: 'current-location',
            path: "current-location",
            builder: (context, state) => const LocationMoverScreen(),
          ),

          GoRoute(
            name: 'add-convert',
            path: "address-conversion/:message",
            builder: (context, state) => AddressConversionScreen(
              msg: state.pathParameters['message']!,
              queryParam: state.uri.queryParameters['queryParam']!,
            ),
          ),

          GoRoute(
            path: "search-places",
            builder: (context, state) => const GoogleSearchPlaces(),
          ),

          GoRoute(
            path: "custom-marker",
            builder: (context, state) => const AddMarkerIcon(),
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