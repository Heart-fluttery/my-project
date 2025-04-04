import 'package:flutter/material.dart';

import 'view/alert.dart';
import 'view/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/alert',
      routes: {
        '/alert' : (context) => Alert(),
        '/second' : (context) => Second()
      },
    );
  }
}