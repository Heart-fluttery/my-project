import 'package:flutter/material.dart';

class Remove extends StatefulWidget {
  const Remove({super.key});

  @override
  State<Remove> createState() => _RemoveState();
}

class _RemoveState extends State<Remove> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('휴지통'),
      ),
    );
  }
}