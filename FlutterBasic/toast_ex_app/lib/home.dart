import 'package:flutter/material.dart';
import 'package:toast_ex_app/mymessage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast Message'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Mymessage(),
    );
  }
}