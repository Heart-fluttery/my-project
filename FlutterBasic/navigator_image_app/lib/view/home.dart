import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/1st'),
              child: Text("Page #1"),
              ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/2nd'),
              child: Text("Page #2"),
              ),
          ],
        ),
      ),
    );
  }
}