import 'package:flutter/material.dart';

class Addlist extends StatefulWidget {
  const Addlist({super.key});

  @override
  State<Addlist> createState() => _AddlistState();
}

class _AddlistState extends State<Addlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('목록 추가하기'),
      ),
    );
  }
}