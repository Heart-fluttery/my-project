import 'package:flutter/material.dart';
import 'package:navigator_app/view/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SecondPage();
            }));
            // scaffold messanger와 같이 메모리 공간만드는 함수
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            foregroundColor: Colors.white
          ),
          child: Text('Go to the second page'),
          ),
      ),
    );
  }
}