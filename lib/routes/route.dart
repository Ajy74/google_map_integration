
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

  static const bool isLogged = true;

  static final GoRouter router = GoRouter(

    //~ redirection 
    // redirect: (context, state) {
    //   if(isLogged){
    //     return "/";
    //   }
    //   else{
    //     return "/404";
    //   }
    // },

    routes: [
      GoRoute(
        name: 'home',
        path: "/",
        builder: (context, state) => const HomeScreen(),
        routes: [
          //~ we can write like this also without using more slash(/) ...as a child routes
          GoRoute(
            path: "404",
            builder: (context, state) => PageNotFoundScreen(
              error: state.extra as String? ?? ' or you are not authorized..',
            ),
          ),

          GoRoute(
            name: 'marker',
            path: "marker",
            // builder: (context, state) => const MarkerScreen(),
            pageBuilder: (context, state) {
               return customPageRouteBuilder(
                const MarkerScreen(),
                state.pageKey,
                transitionDuration: const Duration(milliseconds: 500),
              );
            },
          ),

          GoRoute(
            name: 'current-location',
            path: "current-location",
            builder: (context, state) => const LocationMoverScreen(),
          ),

          GoRoute(
            name: 'add-convert',
            path: "address-conversion/:message",
            // builder: (context, state) => AddressConversionScreen(
            //   msg: state.pathParameters['message']!,
            //   queryParam: state.uri.queryParameters['queryParam']!,
            // ),
            pageBuilder: (context, state) {
              return customPageRouteBuilder(
                AddressConversionScreen(
                  msg: state.pathParameters['message']!,
                  queryParam: state.uri.queryParameters['queryParam']!,
                ),
                state.pageKey,
                transitionDuration: const Duration(milliseconds: 500),
              );
            },
          ),

          GoRoute(
            path: "search-places",
            // builder: (context, state) => const GoogleSearchPlaces(),
            pageBuilder: (context, state) {
              // return CustomTransitionPage(
              //   key: state.pageKey,
              //   child: const GoogleSearchPlaces(),
              //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
              //     const begin = Offset(1.0, 0.0);
              //     const end = Offset.zero;
              //     const curve = Curves.easeInOut;
              //     var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              //     var offsetAnimation = animation.drive(tween);
              //     return SlideTransition(position: offsetAnimation, child: child);
              //   },
              //   transitionDuration: const Duration(milliseconds: 500),
              // );
              return customPageRouteBuilder(
                const GoogleSearchPlaces(),
                state.pageKey,
                transitionDuration: const Duration(milliseconds: 500),
              );
            },
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
      router.go('/404', extra: state.error ?? "");
    },
  );

}

CustomTransitionPage customPageRouteBuilder(Widget page, LocalKey pageKey, {required Duration transitionDuration}) {
  return CustomTransitionPage(
    key: pageKey,
    child: page,
    fullscreenDialog: true,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
    transitionDuration: transitionDuration,
  );
}