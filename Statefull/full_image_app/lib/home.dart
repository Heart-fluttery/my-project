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
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size; // 화면 사이즈 구하기
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/${imageFiles[currentImage]}',
            fit: BoxFit.fill,
            width: screenWidth,
            height: screenHeight,
            ),
            Positioned(
              left: 10,
              top: screenHeight/2,
              child: ElevatedButton(
                onPressed: () {
                  prevButton();
                },
                child: Icon(Icons.arrow_left_rounded,
                ),
              ),
            ),
            Positioned(
              top: screenHeight/2,
              left: screenWidth-75,
              child: ElevatedButton(
                onPressed: () {
                  nextButton();
                },
                child: Icon(Icons.arrow_right),
              ),
            ),
        ],
      ),
    );
  }

    prevButton(){
    currentImage--;
    if (currentImage < 0) {
      currentImage = imageFiles.length -1;
    }
    setState(() {});
  }

  nextButton(){
    currentImage++;
    if (currentImage >= imageFiles.length) {
      currentImage = 0;
    }
    setState(() {});
    }
  }
  
