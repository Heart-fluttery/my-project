import 'package:flutter/material.dart';
import 'package:listview_app/home.dart';
import 'package:listview_app/id.dart';

void main() {
  runApp(const MyApp());
}
/*
작성일 2025.04.02 작성자 이학현
간단한 모델 및 동물 ListView 제작 
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/id' : (context) => Id(),
        '/' : (context) => Home(),
      },
      initialRoute: '/',
    );
  }
}