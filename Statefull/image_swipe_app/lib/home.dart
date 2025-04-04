import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> imageName;
  late int currentImage; // [currentImage]

  @override
  void initState() {
    super.initState();
  imageName = [
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Swiping'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: (direction) => _onSwipe(direction),
        onVerticalSwipe: (direction) => _onSwipe(direction),
        onDoubleTap: () =>  _onDoubleTap(),
        // direction 안에 스와이핑 값이 있음
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentImage],
                ),
                Image.asset(
                  'images/${imageName[currentImage]}',
                  width: 350,
                ),
            ],
          ),
        ),
      )
    );
  } // build

  // ---- Functions ----
  _onSwipe(SwipeDirection direction){
    if (direction == SwipeDirection. left || direction == SwipeDirection.right){
      _onHorizontalSwipe(direction);
    }else{
      _onHorizontalSwipe(direction);
    }
  }
  _onHorizontalSwipe(SwipeDirection direction){
    if (direction == SwipeDirection.left || direction == SwipeDirection.up) { // right to left
      currentImage++;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
    }else{ // left to right
    currentImage--;
    if (currentImage < 0) {
      currentImage = imageName.length-1;
    }
    }
    setState(() {});
  }

  _onDoubleTap(){
    currentImage++;
    if (currentImage >= imageName.length) {
      currentImage = 0;
    }
    setState(() {});
  }
} // class