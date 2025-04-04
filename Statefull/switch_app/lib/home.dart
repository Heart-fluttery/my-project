import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late bool switchValue;
  late String appbartitle;
  late String imageName;
  late Color mainColor;

  @override
  void initState() {
    super.initState();
    switchValue = true;
    appbartitle = "쿵이";
    imageName = '201157139.jpeg';
    mainColor = Colors.lightGreenAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: Text(appbartitle),
        backgroundColor: mainColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset('images/$imageName',
              height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Switch( // switch 같이 모양이 변하는건 onChanged
                value: switchValue, // true, false로 들어가면 사용자가 못 바꿈 변수로 넣어야함
                onChanged: (value) => switchChange(value), // 여기 value는 사용자가 스위치를 바꿨을 때의 값
              ),
            ),
          ],
        ),
      ),
    );
  } // build

  // ---- Functions ----
  switchChange(value){
    switchValue = value; // switchValue = 사용자가 바꾼 value
    imageName = switchValue == true? '201157139.jpeg' : 'em.webp';
    appbartitle = switchValue == true? '쿵이' : '엘모';
    mainColor = switchValue == true? Colors.lightGreenAccent : Colors.redAccent;
    setState(() {});
  }
} // class