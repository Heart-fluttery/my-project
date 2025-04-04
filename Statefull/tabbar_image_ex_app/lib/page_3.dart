import 'dart:async';

import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  late List<String> imagesName;
  late int currentImage;
  // late Timer _timer;

  @override
  void initState() {
    super.initState();
  imagesName = [
    'flower_01.png',
    'flower_02.png',
    'flower_03.png',
    'flower_04.png',
    'flower_05.png',
    'flower_06.png',
  ];
  currentImage = 0;
  Timer.periodic(Duration(seconds: 1), (timer) {
    changeImage();
  },);
  }

  changeImage(){
    if(!mounted) return; // 위젯이 dispose되면 상태를 업데이트하지 않음
    // dispose 이후에 setState되는걸 방지함
    currentImage++;
    if (currentImage >= imagesName.length) {
      currentImage = 0;
    }
    setState(() {});
  }

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(imagesName[currentImage]),
            Image.asset(
            'images/${imagesName[currentImage]}',
            width: 300,
            ),
          ],
        ),
      ),
    );
  } // build

  // ---- Functions ----
  prebutton(){
    currentImage --;
    if (currentImage < 0) {
      currentImage = imagesName.length-1;
    }
    setState(() {});
  }

  nextbutton(){
    currentImage++;
    if (currentImage >= imagesName.length) {
      currentImage = 0;
    }
    setState(() {});
  }
} // class