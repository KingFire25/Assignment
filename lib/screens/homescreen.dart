// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class homeScreen extends StatefulWidget
{
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }
  @override
  void initState(){
    getUserCurrentLocation();
    super.initState(); 
  }
  Widget build(BuildContext context) {
    Position? currPos;
    String add = "  Mountain View, California, \n  United States";
    TextEditingController _name = TextEditingController(),_num= TextEditingController();
    late GoogleMapController mapController;
    final LatLng _pos = const LatLng(45.521563, -122.677433);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }
    bool _val = false;

        
    Marker mark = Marker(markerId: MarkerId("Source"),position: _pos);
    Set<Marker> _mark = Set();
    _mark.add(mark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:DefaultTabController(
        length: 2,
        child:Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: TabBar(tabs: [
          Tab(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.assignment_ind),
              Text("   Details",style: TextStyle(fontSize: 15),),
            ],
          ),),
          Tab(child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_sharp),
              Text("   Location",style: TextStyle(fontSize: 15),),
            ],
          ),),
          ],
          ),
        title: Text("Hello"),
      ),
      drawer: Drawer(
        elevation: null,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('example@gmail.com'),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/image1.jpg')),
            ),
            Row(
              children: [
                Icon(Icons.location_on_sharp),
                Text(add, style: TextStyle(fontSize: 16),),
              ],
            )
          ],
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(), children:[
        Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              readOnly: _val,
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Name",
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
               readOnly: _val,
              controller: _num,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Number",
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(height: 10,),
          FloatingActionButton.extended(elevation: 0,onPressed: (){
            setState(() {
              _val= false;
            });
          }, 
          label: Row(children: [Icon(Icons.edit),Text("  Edit"),],)
          ),
          SizedBox(height: 10,),
          FloatingActionButton.extended(elevation: 0,onPressed: (){
            setState(() {
              _val= true;
            });
          }, 
          label: Row(children: [Icon(Icons.save),Text("  Save"),],)
          ),
        ],
      ),
       GoogleMap(
          padding: EdgeInsets.all(20),
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _pos,
                  zoom: 14,
                ),
                
                  onTap: (LatLng latlng){
                    _mark.add(Marker(markerId: MarkerId('mark'), position: latlng));
                    setState(() {});
                  },
                markers: Set<Marker>.of(_mark),
              ),
      ]
      )
    ),
      ),
      );
  }
}
