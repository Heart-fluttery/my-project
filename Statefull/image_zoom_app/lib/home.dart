import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int switchCount; // 0: 켜짐, 1: 꺼짐, 2: 깨짐
  late bool zoom; // 버튼 온오프 true: small false: big
  late int angle;
  late String imageName; // 전구 파일 이름
  late bool onOff; // 전구 스위치
  @override
  void initState() {
    super.initState();
    switchCount = 0;
    zoom = true;
    angle = 0;

    Timer.periodic(Duration(seconds: 1), (timer) {
      changeAngle();
    },);
  }
  changeAngle(){
    if (zoom == false) {
      angle -= 45;
      if (angle < -360) {
        angle = 0;
      }
    }else{
      angle += 45;
      if (angle > 360) {
        angle = 0;
      }
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image 확대 및 축소'),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: AlwaysStoppedAnimation(angle/360),
              child: SizedBox(
                width: 330,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/$imageName',
                      width: (zoom == true? 100 : 300),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    buttonChange();
                  },
                  child: Text(zoom == true? 'Image 확대' : 'Image 축소'),
                  ),
            Column(
              children: [
                Text('전구 스위치',
                style: TextStyle(
                  fontSize: 9
                  ),
                ),
                Switch(
                  value: onOff,
                  onChanged: (value) {
                    onOff = value;
                    switchChange();
                  },
                ),
              ],
            ),
              ],
            ),
          ],
        ),
      ),
    );
  } // build

  // ---- Functions ----
  switchChange(){
    onOff != onOff;
    switchCount++;
    if (switchCount > 3) {
      switchCount = 0;
    }
    setState(() {});
  }

  buttonChange(){
    zoom = zoom == true? false : true;
    setState(() {});
  }
} // class