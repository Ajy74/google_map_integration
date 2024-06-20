
import 'package:flutter/material.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Text("Page not Found !!",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),
        ),
      ),
    );
  }
}