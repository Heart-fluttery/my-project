import 'package:flutter/material.dart';

class FirstImagePage extends StatelessWidget {
  const FirstImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen #1 Image Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Column(
            children: [
              Image.asset('images/201157139.jpeg'),
              ElevatedButton(
                onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                },
                child: Text('Go to Home'),
                ),
            ],
          ),
            ],
        ),
      ),
    );
  }
}