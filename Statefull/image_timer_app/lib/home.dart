import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> imageFiles;
  late int currentImage;

  @override
  void initState() {
    super.initState();
    imageFiles = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentImage = 0;

    // Timer설치 2개 있는데 dart:async 클래스 사용해야함
    Timer.periodic(Duration(seconds: 1), (timer) { // 3초마다 실행
      changeImage();
    },);
  } // init.state

  changeImage(){
    currentImage++;
    if(currentImage >= imageFiles.length){
      currentImage = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3초마다 이미지 무한 반복'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(imageFiles[currentImage],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'images/${imageFiles[currentImage]}'
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}