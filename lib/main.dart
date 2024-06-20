import 'package:flutter/material.dart';
import 'package:google_map_integration/routes/route.dart';
import 'package:google_map_integration/views/home_sceen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Google Map Integration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      // home: const HomeScreen(),
      routerConfig: AppRoute.router,
    );
  }
}

