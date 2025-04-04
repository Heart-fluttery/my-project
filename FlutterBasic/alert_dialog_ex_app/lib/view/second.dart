import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.redAccent,
        title: Text('Second Page',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
      body: Center(
        child: Text('2번째 페이지입니다.'),
      ),
    );
  }
}