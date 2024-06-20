
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


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
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return const MarkerScreen();
                  // },));

                  //~ using GoRouter
                  // GoRouter.of(context).go("/marker");
                  // context.go("/marker");
                  context.goNamed("marker");
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return const LocationMoverScreen();
                  // },));

                  // context.go("/current-location");
                  context.goNamed("current-location");
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return const AddressConversionScreen();
                  // },));

                  // context.go("/address-conversion/tap on below options..");
                  context.goNamed(
                    "add-convert",
                    pathParameters: {
                      "message": "tap on below options..."
                    },
                    queryParameters: {
                      "queryParam": "Address Conversion Page"
                    }
                  );
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return const GoogleSearchPlaces();
                  // },));
                  
                  context.go("/search-places");
                },
                child: const Text(
                  "Search Places"
                ),
              ),
            ),

            const SizedBox(height: 15,),
            SizedBox(
              width: double.maxFinite,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return const AddMarkerIcon();
                  // },));

                  context.go("/custom-marker");
                },
                child: const Text(
                  "Custom Icon Marker"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}