import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:must_eat_place_app/vm/database_handler.dart';
import 'package:latlong2/latlong.dart' as latlng;

class Ontaplocator extends StatefulWidget {
  const Ontaplocator({super.key});

  @override
  State<Ontaplocator> createState() => _OntaplocatorState();
}

class _OntaplocatorState extends State<Ontaplocator> {
  // Property
  late DatabaseHandler handler;
  late Position currentPosition; // 현재 위치
  late double latData; // 위도
  late double longData; // 경도
  late MapController mapController; // controller라서 setstate 필요없음
  late bool canRun; // GPS 신호 수신 여부
  final value = Get.arguments;
  

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    mapController = MapController();
    canRun = false;
    
      latData = value[0];
      longData = value[1];
      canRun = true;
      setState(() {});
  }

  checkLocationPermission() async {
  // 현재 위치 권한 상태를 확인한다.
  LocationPermission permission = await Geolocator.checkPermission();

  // 만약 권한이 거부된 상태라면, 사용자에게 권한을 요청한다.
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  // 권한이 영구적으로 거부된 상태라면 더 이상 진행하지 않는다.
  if (permission == LocationPermission.deniedForever) {
    return; // 아무 작업도 하지 않고 종료
  }

  // 권한이 '앱 사용 중에 허용' 또는 '항상 허용' 상태라면 위치 정보를 가져온다.
  if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
    getCurrentLocation(); // 위치를 가져오는 함수 호출
  }
}

  getCurrentLocation() async {
    // 현재 위치 정보를 받아올 때까지 기다린다 (위도/경도 포함된 Position 객체)
    Position position = await Geolocator.getCurrentPosition();

    // 받아온 위치 정보를 currentPosition 변수에 저장한다
    currentPosition = position;

    // GPS 가져와서 변경
    canRun = true;

    // 현재 위치에서 위도(latitude)를 꺼내 저장한다
    latData = currentPosition.latitude;

    // 현재 위치에서 경도(longitude)를 꺼내 저장한다
    longData = currentPosition.longitude;

    // 화면을 다시 그리기 위해 상태 갱신 (변경 사항 반영)
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('맛집 위치'),
        centerTitle: true,
      ),
      body: canRun
      ? flutterMap()
      : Center(child: CircularProgressIndicator()), // 로딩화면
    );
  }

    Widget flutterMap() {
    return FlutterMap(
      mapController: mapController, // 위에서 만든 지도 컨트롤러 사용
      options: MapOptions(
        initialCenter: latlng.LatLng(latData, longData), // 초기 위치 중심
        initialZoom: 17.0, // 초기 줌 레벨
        onPositionChanged: (position, hasGesture) {
          if (hasGesture){ // 지도를 움직일 때 true
            latData = position.center.latitude;
            longData = position.center.longitude;
            setState(() {});
          }
        },
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          // 지도 이미지를 가져오는 URL 템플릿 (OpenStreetMap 사용)
        ),
MarkerLayer(
  markers: [
        Marker(
          width: 80,
          height: 80,
          point: latlng.LatLng(value[0], value[1]), // 다른 위치
          child: Column(
            children: [
              SizedBox(
                child: Text(
                  '${value[2]}',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Icon(
                Icons.location_on,
                size: 50,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ]
)
      ],
    );
  }
  
}