import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property(aka Field, Attribute 바뀌는 요소들이 들어감)
  late String buttonState; // 첫번째로 실행
  late Color buttonColor;
  late Color buttonTextColor;

  @override
  void initState() {
    super.initState(); 
    // 두번째로 실행, 여기까지 초기화면 설정이라 한번 실행하고 끝 initState로 초기값 설정
    buttonState = 'OFF';
    buttonColor = Colors.blueAccent;
    buttonTextColor = Colors.white;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Life cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _onClick(),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: buttonTextColor,
              ),
              child: Text('버튼을 누르세요'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('버튼 상태:'),
                Text(buttonState)
              ],
            )
          ],
        ),
      ),
    );
  } // build

  // --- functions ---
  _onClick(){
    buttonState == "ON" ? {buttonState = "OFF", buttonColor = Colors.red, buttonTextColor = Colors.black} 
    : {buttonState = "ON", buttonColor = Colors.blueAccent, buttonTextColor = Colors.white};
    setState(() {}); // build에 알려주는 역할
  }
} // Class