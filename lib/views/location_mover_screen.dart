import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMoverScreen extends StatefulWidget {
  const LocationMoverScreen({super.key});

  @override
  State<LocationMoverScreen> createState() => _LocationMoverScreenState();
}

class _LocationMoverScreenState extends State<LocationMoverScreen> {
  
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _initialPos = CameraPosition(
    target: LatLng(19.197575,73.1020543),
    zoom: 14.4746,
  );

  static const CameraPosition moveToLocation = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(19.197575,73.1020543),
      tilt: 50.440717697143555,
      zoom: 19.151926040649414);


  final List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(19.197575,73.1020543),
      infoWindow:  InfoWindow(
        title: "Angel Pride",
      )
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(19.1952656,73.1030163),
      infoWindow:  InfoWindow(
        title: "Gaon Devi Mandir",
      )
    ),
  ];


  @override
  void initState() {
    super.initState();

    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _initialPos,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _moveToLocation,
        label: const Text('Current Location!'),
        icon: const Icon(Icons.directions_sharp),
      ),
    );
  }

  Future<void> _moveToLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(moveToLocation));
  }
}