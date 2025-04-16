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
  late List latlong;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    latlong = [
      ['혜화문', 37.5878892, 127.0037098],
      ['흥인지문', 37.5711907, 127.009506],
      ['창의문', 37.5926027, 126.9664771],
      ['숙정문', 37.5956584, 126.9810576],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: flutterMap()
    );
  } // build

  // --- Widget Function ---
  Marker makeMarker(String name, double mLat, double mLong, Color mColor){
    return Marker(
      width: 80,
      height: 80,
      point: latlng.LatLng(mLat, mLong),
      child: Builder(builder: (context) {
        return Column(
          children: [
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.pin_drop,
              size: 50,
              color: mColor,
            )
          ],
        );
      },),
    );
  }
  // --- Widget ----
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
            makeMarker(latlong[0][0], latlong[0][1], latlong[0][2], Colors.black),
            makeMarker(latlong[1][0], latlong[1][1], latlong[1][2], Colors.black),
            makeMarker(latlong[2][0], latlong[2][1], latlong[2][2], Colors.black),
            makeMarker(latlong[3][0], latlong[3][1], latlong[3][2], Colors.black),
            // Marker(
            //   width: 80,
            //   height: 80,
            //   point: latlng.LatLng(37.5878892, 127.0037098), 
            //   child: Column(
            //     children: [
            //       Text(
            //         '혜화문',
            //         style: TextStyle(
            //           fontSize: 10,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.deepPurpleAccent,
            //         ),
            //       ),
            //       Icon(
            //         Icons.pin_drop,
            //         size: 50,
            //         color: Colors.deepPurpleAccent,
            //       ),
            //     ],
            //   ),
            // ),
            // Marker(
            //   point: latlng.LatLng(37.5711907, 127.009506), 
            //   child: Column(
            //     children: [
            //       Text(
            //         '흥인지문',
            //         style: TextStyle(
            //           fontSize: 10,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black,
            //         ),
            //       ),
            //       Icon(
            //         Icons.pin_drop,
            //         size: 50,
            //         color: Colors.black,
            //       ),
            //     ],
            //   ),
            // ),
            // Marker(
            //   point: latlng.LatLng(37.5926027, 126.9664771), 
            //   child: Column(
            //     children: [
            //       Text(
            //         '창의문',
            //         style: TextStyle(
            //           fontSize: 10,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.red,
            //         ),
            //       ),
            //       Icon(
            //         Icons.pin_drop,
            //         size: 50,
            //         color: Colors.red,
            //       ),
            //     ],
            //   ),
            // ),
            // Marker(
            //   point: latlng.LatLng(37.5956584, 126.9810576), 
            //   child: Column(
            //     children: [
            //       Text(
            //         '숙정문',
            //         style: TextStyle(
            //           fontSize: 10,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.blue,
            //         ),
            //       ),
            //       Icon(
            //         Icons.pin_drop,
            //         size: 50,
            //         color: Colors.blue,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
} // class