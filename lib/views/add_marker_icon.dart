import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddMarkerIcon extends StatefulWidget {
  const AddMarkerIcon({super.key});

  @override
  State<AddMarkerIcon> createState() => _AddMarkerIconState();
}

class _AddMarkerIconState extends State<AddMarkerIcon> {
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

  
  Uint8List? markerImages;

  List<String> images = ['assets/car.png', 'assets/pizza-deliver.png'];
  List<LatLng> latlong = [ const LatLng(19.197575,73.1020543), const LatLng(19.1952656,73.1030163)];

  final List<Marker> _marker = [];
  // final List<Marker> _list = const [
  //   Marker(
  //     markerId: MarkerId('1'),
  //     position: LatLng(19.197575,73.1020543),
  //     infoWindow:  InfoWindow(
  //       title: "Angel Pride",
  //     )
  //   ),
  //   Marker(
  //     markerId: MarkerId('2'),
  //     position: LatLng(19.1952656,73.1030163),
  //     infoWindow:  InfoWindow(
  //       title: "Gaon Devi Mandir",
  //     )
  //   ),
  // ];


  @override
  void initState() {
    super.initState();

    // _marker.addAll(_list);
    loadData();
  }


  Future<Uint8List> getBytesFromAssets(String path, int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  loadData() async{
    for (int i = 0; i < images.length; i++) {

      final Uint8List markerIcon = await getBytesFromAssets(images[i], 100);

      _marker.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: latlong[i],
          infoWindow:  InfoWindow(
            title: "Marker_${i+1}",
          ),
          icon: BitmapDescriptor.fromBytes(markerIcon)
        )
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
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
    // await controller.animateCamera(CameraUpdate.newCameraPosition(moveToLocation));

    _getCurrentLocation().then((value) async{
      // if (kDebugMode) {
      //   print("my current location >>\n$value");
      // }

      _marker.add(
        Marker(
          markerId: const MarkerId('3'),
          position: LatLng(value.latitude,value.longitude),
          infoWindow:  const InfoWindow(
            title: "current location",
          )
        )
      );

      CameraPosition moveToCurrentLocation = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(value.latitude,value.longitude),
        tilt: 50.440717697143555,
        zoom: 19.151926040649414
      );

      await controller.animateCamera(CameraUpdate.newCameraPosition(moveToCurrentLocation));

      setState(() { });

    });
  }

  Future<Position> _getCurrentLocation() async {
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print("error:-> ${error.toString()}");
      }
    });

    return await Geolocator.getCurrentPosition(); 
  }
}