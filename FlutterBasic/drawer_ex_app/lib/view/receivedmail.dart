import 'package:flutter/material.dart';

class Receivedmail extends StatelessWidget {
  const Receivedmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Received Mail"),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}