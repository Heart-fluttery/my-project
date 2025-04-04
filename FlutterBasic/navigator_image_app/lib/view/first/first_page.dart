import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen #1'),
      ),
      body: Center(
        child: Column(
          children: [ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/1st/image'),
            child: Text('Image Page'))],
        ),
      ),
    );
  }
}