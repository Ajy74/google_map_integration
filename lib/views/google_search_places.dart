
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class GoogleSearchPlaces extends StatefulWidget {
  const GoogleSearchPlaces({super.key});

  @override
  State<GoogleSearchPlaces> createState() => _GoogleSearchPlacesState();
}

class _GoogleSearchPlacesState extends State<GoogleSearchPlaces> {

  TextEditingController tc = TextEditingController();
  var uuid = Uuid();
  String _sessionToken = '123456779';
  List<dynamic> placesList = [] ;
  String convertedText = '';

  @override
  void initState() {
    super.initState();

    tc.addListener(() { 
      onChange();
    });
  }

  void onChange(){
    if(_sessionToken.isEmpty){
      setState(() {
        _sessionToken = uuid.v4();
      });
    }

    getSuggestion(tc.text);
  }

  void getSuggestion(String input) async{
    const String PLACES_API_KEY = "AIzaSyD3t6H9yoFcwZV9a9_uQsKy7WAJjViZGrs" ;
    const String baseUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json" ; 
    String request = '$baseUrl?input=$input&key=$PLACES_API_KEY&sessiontoken=$_sessionToken';

    var response = await http.get(Uri.parse(request));

    // print("aaaa--> ${response.body.toString()}");
    if(response.statusCode == 200){
      setState(() {
        placesList = jsonDecode(response.body.toString()) ['predictions'];
      });
    }
    else{
      throw Exception('Failed to load data !!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Places"),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 12),
        child: Column(
          children: [
            Text(
              "Coardinates: (${convertedText.trim()})"
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: tc,
              decoration: const InputDecoration(
                hintText: "Search places with name"
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: placesList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(placesList[index]['description']),
                    onTap: () async{
                        try {
                          List<Location> locations = await locationFromAddress(placesList[index]['description']);
                          setState(() {
                            convertedText = "${locations[0]}";
                          });
                        } catch (e) {
                          convertedText = e.toString();
                        }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}