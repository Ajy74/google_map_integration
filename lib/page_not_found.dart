
import 'package:flutter/material.dart';

class PageNotFoundScreen extends StatelessWidget {
  final String error;
  const PageNotFoundScreen({super.key,required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("Page not Found !!\n$error",
            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),
          ),
        ),
      ),
    );
  }
}