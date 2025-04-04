import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late List<String> imagesName;
  late int currentImage;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    prebutton();
                  },
                  child: Text('이전'),
                ),
            ElevatedButton(
              onPressed: () {
                nextbutton();
              },
              child: Text('다음'),
            ),
              ],
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