import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int currentImage;
  late List<String> imageName;

  @override
  void initState() {
    super.initState();
    currentImage = 0;
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 101, 101, 101),
      appBar: AppBar(
        title: Text('무한 이미지 반복'),
        backgroundColor: const Color.fromRGBO(240, 255, 129, 1),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(imageName[currentImage],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white
              ),),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Image.asset('images/${imageName[currentImage]}',
                width: 350,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      leftButtonClick();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                    child: Text('<< 이전',
                    style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      rightButtonClick();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                    child: Text('다음 >>',
                    style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  } // build

  // ---- Functions ----
  rightButtonClick(){
    currentImage++;
    if (currentImage >= imageName.length) {
      currentImage = 0;
    }
    setState(() {});
  }

  leftButtonClick(){
    currentImage--;
    if (currentImage < 0) {
      currentImage = imageName.length-1;
    }
    setState(() {});
  }
} // class