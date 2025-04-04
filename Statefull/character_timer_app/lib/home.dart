import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> textList;
  late int currentText;
  late String character;

  @override
  void initState() {
    super.initState();
    String data = '쿵이가 보고싶다';
    textList = data.split(''); // data를 한글자씩 자른다.
    currentText = 0;
    character = textList[currentText]; // 화면에 보이는 초기 글자 설정

    Timer.periodic(Duration(seconds: 1), (timer) {
      textChange();
    },);
  } // init.State

  textChange(){
    currentText++;
    if (currentText >= textList.length) {
      currentText = 0;
      character = textList[currentText];
    }else{
      character += textList[currentText];
    }
    setState(() {});
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LED 광고'),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text(
          character,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}