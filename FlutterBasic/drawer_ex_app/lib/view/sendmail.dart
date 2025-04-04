import 'package:flutter/material.dart';

class Sendmail extends StatelessWidget {
  const Sendmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Mail"),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}