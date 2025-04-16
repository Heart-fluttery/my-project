import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: flutterMap()
    );
  } // build

  // --- Functions ----
  Widget flutterMap(){
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: latlng.LatLng(37.5878892, 127.0037098), initialZoom: 13
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(37.5878892, 127.0037098), 
              child: Column(
                children: [
                  Text(
                    '혜화문',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 50,
                    color: Colors.deepPurpleAccent,
                  ),
                ],
              ),
            ),
            Marker(
              point: latlng.LatLng(37.5711907, 127.009506), 
              child: Column(
                children: [
                  Text(
                    '흥인지문',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 50,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Marker(
              point: latlng.LatLng(37.5926027, 126.9664771), 
              child: Column(
                children: [
                  Text(
                    '창의문',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 50,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Marker(
              point: latlng.LatLng(37.5956584, 126.9810576), 
              child: Column(
                children: [
                  Text(
                    '숙정문',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 50,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
} // class