import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Second Page'),
      //   backgroundColor: Colors.blueAccent,
      //   foregroundColor: Colors.white,
      //   centerTitle: true,
      // ),
      body: Center(
        child: Text('두번째 페이지'),
      ),
    );
  }
}