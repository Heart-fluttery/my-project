import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alert Dialog with Gesture'
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog, // 원래 있는 이름의 함수라 _ 붙여서 프라이빗 함수생성
          child: Text(
            'Hello World!',
            ),
          ),
      ),
    );
  } // build

  // ---- Functions ----
  _showDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.amberAccent,
      builder: (context){ // 메모리 잡아주는 애
        return AlertDialog(
          title: Text('Alert Title'),
          content: Text('Hello World를 Touch했습니다.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              // Navigator.pop(context)는 뒤에 화면을 지워서 위같이 씀
              child: Text('종료'),
              ),
          ],
        );
      },
    );
  }
} // Home