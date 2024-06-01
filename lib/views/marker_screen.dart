import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerScreen extends StatefulWidget {
  const MarkerScreen({super.key});

  @override
  State<MarkerScreen> createState() => _MarkerScreenState();
}

class _MarkerScreenState extends State<MarkerScreen> {

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _initialPos = CameraPosition(
    target: LatLng(19.212720, 73.098130),
    zoom: 14.4746,
  );

  final List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(19.212720, 73.098130),
      infoWindow:  InfoWindow(
        title: "My Current Location",
      )
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(19.213125,73.103800),
      infoWindow:  InfoWindow(
        title: "Rotary Park",
      )
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(19.214064,73.099834),
      infoWindow:  InfoWindow(
        title: "Dombivali Gymkhana",
      )
    )
  ];


  @override
  void initState() {
    super.initState();

    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child : GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _initialPos,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}