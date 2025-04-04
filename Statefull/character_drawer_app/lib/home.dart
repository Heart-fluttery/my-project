import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1Controller; // 글자 입력
  late String character; // 출력 글자
  late int currentText; // 글자 순서
  late List<String> str; // 글자 리스트

  @override
  void initState() {
    super.initState();
    currentText = 0;
    num1Controller = TextEditingController();
    str = num1Controller.text.trim().isEmpty? [''] : num1Controller.text.split('');
    character = str[currentText];
    
    Timer.periodic(Duration(seconds: 1), (timer) {
    characterChange();
    },);

  } // init.State

  characterChange(){
    if (currentText >= str.length) {
      currentText = 0;
      character = str[currentText];
    }else{
      character += str[currentText];
      currentText++;
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LED 광고'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              character,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('광고 문구를 입력하세요',
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              ),
              TextField(
                controller: num1Controller,
                decoration: InputDecoration(
                  labelText: '글자를 입력하세요',
                ),
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                onPressed: () {
                  currentText = 0;
                  buttonClick();
                },
                child: Text('광고문구 생성'),
              ),
          ],
        ),
      ),
    );
  } // build

  // ---- Functions ----
  buttonClick(){
    str = num1Controller.text.split('');
    Navigator.of(context).pop();
    characterChange();
  }
} // class