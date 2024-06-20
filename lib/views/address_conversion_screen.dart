
import 'package:flutter/material.dart';
// import 'package:geocoder2/geocoder2.dart';
import 'package:geocoding/geocoding.dart';



class AddressConversionScreen extends StatefulWidget {
  final String msg;
  final String queryParam;
  const AddressConversionScreen({super.key, required this.msg, required this.queryParam});

  @override
  State<AddressConversionScreen> createState() => _AddressConversionScreenState();
}

class _AddressConversionScreenState extends State<AddressConversionScreen> {

  
  String? convertedText ;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        // title: const Text("Convert Address"),
        title: Text(widget.queryParam),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Conversion will show here :",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23
                ),
                textAlign: TextAlign.left,
              ),
            ),

            const SizedBox(height: 2,),
            Container(
              alignment: Alignment.centerLeft,
              // height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(.05),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                "${convertedText ?? "${widget.msg}"}",
                style: const TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
                textAlign: TextAlign.left,
              ),
            ),

            const SizedBox(height: 25,),

            SizedBox(
              width: double.maxFinite,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  addressToCoardinates();
                },
                child: const Text(
                  "Convert to Lat,Long"
                ),
              ),
            ),

            const SizedBox(height: 15,),

            SizedBox(
              width: double.maxFinite,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  coardinateToAddress();
                },
                child: const Text(
                  "Convert to Address"
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  
  void coardinateToAddress() async{
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(19.197575,73.1020543);
      // List<Placemark> placemarks = await placemarkFromCoordinates(19.1952656,73.1030163);
      setState(() {
        convertedText = "${placemarks[0]}";
      });
    } catch (e) {
      setState(() {
        convertedText = e.toString();
      });
    }
  }
  
  void addressToCoardinates() async{
    try {
      List<Location> locations = await locationFromAddress("angel pride building, sonarpada near shiv sena office, dombivli east, 421201");
      setState(() {
        convertedText = "${locations[0]}";
      });
    } catch (e) {
      convertedText = e.toString();
    }

  }

}