
import 'package:flutter/material.dart';
import 'package:google_map_integration/views/address_conversion_screen.dart';
import 'package:google_map_integration/views/google_search_places.dart';
import 'package:google_map_integration/views/location_mover_screen.dart';
import 'package:google_map_integration/views/marker_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: const Text(
          "Home"
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MarkerScreen();
                  },));
                },
                child: const Text(
                  "Place Marker Integration"
                ),
              ),
            ),

            const SizedBox(height: 15,),

            SizedBox(
              width: double.maxFinite,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LocationMoverScreen();
                  },));
                },
                child: const Text(
                  "Current Location"
                ),
              ),
            ),

            const SizedBox(height: 15,),

            SizedBox(
              width: double.maxFinite,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AddressConversionScreen();
                  },));
                },
                child: const Text(
                  "Address Converion"
                ),
              ),
            ),

            const SizedBox(height: 15,),

            SizedBox(
              width: double.maxFinite,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const GoogleSearchPlaces();
                  },));
                },
                child: const Text(
                  "Search Places"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}