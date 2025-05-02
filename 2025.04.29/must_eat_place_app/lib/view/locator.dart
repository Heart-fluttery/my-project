/*
2025.04.29 이학현
먼저 GPS로 현재 위치 잡기
*/
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:must_eat_place_app/view/home.dart';
import 'package:must_eat_place_app/vm/database_handler.dart';

class Locator extends StatefulWidget {
  final bool isEditMode; // 위치 추가인지 수정인지 구분
  const Locator({super.key, required this.isEditMode});

  @override
  State<Locator> createState() => _LocatorState();
}

class _LocatorState extends State<Locator> {
  // Property
  late DatabaseHandler handler;
  late Position currentPosition; // 현재 위치
  late double latData; // 위도
  late double longData; // 경도
  late MapController mapController; // controller라서 setstate 필요없음
  late bool canRun; // GPS 신호 수신 여부

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    mapController = MapController();
    canRun = false;

    // 수정 모드일 경우 기존 위치
    if (widget.isEditMode){
      // 수정 페이지에서 넘어올 때 기존 위치 get argument로 받기
    }else{ // 아닌 경우 현재 위치
    checkLocationPermission();
    }

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
        leading: TextButton(
          onPressed: () {
            Get.back();
            setState(() {
              
            });
          } ,
          child: Text('취소'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: {
                'lat':latData, 
                'long':longData,
                });
            }, 
            child: Text('저장'),
          ),
        ],
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
            // 여기에 if(widget.isEditMode)넣어서 다르게 만들기
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(latData, longData), // 핀 위치
              child: Column(
                children: [
                  SizedBox(
                    child: Text(
                      '현재 위치',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.pin_drop, // 핀 아이콘
                    size: 50,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
  
}