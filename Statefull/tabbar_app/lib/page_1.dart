import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('First Page'),
      //   backgroundColor: Colors.blueAccent,
      //   foregroundColor: Colors.white,
      //   centerTitle: true,
      // ),
      body: Center(
        child: Text('첫번째 페이지'),
      ),
    );
  }
}