
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AddressConversionScreen extends StatefulWidget {
  const AddressConversionScreen({super.key});

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
        title: const Text("Convert Address"),
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
                "${convertedText ?? " "}",
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
    
  }
  
  void addressToCoardinates() async{
    
  }

}