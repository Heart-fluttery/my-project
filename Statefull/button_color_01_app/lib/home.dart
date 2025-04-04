import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late String buttonText;
  late bool buttonCheck; // Hello:true, Flutter:false 헬로는 트루 플러터는 폴스라고 스스로 정의
  late Color buttonBackColor;
  late Color backGroundColor; // 화면 전체 색깔 정의
  late int clickCount; // 버튼 누른 횟수

  @override
  void initState() {
    super.initState();
    buttonText = "Hello";
    buttonCheck = true;
    buttonBackColor = Colors.blueAccent;
    backGroundColor = Colors.white;
    clickCount = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        title: Text('Change button color & Text'),
        backgroundColor: backGroundColor,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onClick();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonBackColor,
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white
            ),
            ),
        ),
      ),
    );
  } // build

  // ---- Functions ----
  onClick(){
    print("현재 상태 : $buttonText, $buttonCheck, ${buttonBackColor == Colors.blueAccent? "Blue" : "amber"}");
    buttonCheck == true ? {buttonText = "Flutter", buttonCheck = false, buttonBackColor = Colors.amberAccent}
    : {buttonText = "Hello", buttonCheck = true, buttonBackColor = Colors.blueAccent};
    print("바뀔 상태 : $buttonText, $buttonCheck, ${buttonBackColor == Colors.blueAccent? "Blue" : "amber"}");
    print("-----------------------");
    clickCount++;
    backGroundColor = (clickCount ~/ 10)%2 == 1 ? Colors.blueAccent : Colors.amberAccent;
    clickCount == 50 ? GestureDetector(
      onTap: () => _showDialog(context),
      child: Text(
        '버튼을 너무 많이 눌렀습니다.'
      ),
    ) : "";
    setState(() {});
  }

  _showDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          title: Text('버튼을 너무 많이 눌렀습니다.'),
          content: Text('그만 누르세요.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent
              ),
              child: Text("Cancel",
              style: TextStyle(
                color: Colors.white
              ),),
            ),
          ],
        );
      }
    );
  }
} // Class