import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Padding'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Center(
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'images/201157139.jpeg',
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'images/pikachu-1.png',
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'images/201157139.jpeg',
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}