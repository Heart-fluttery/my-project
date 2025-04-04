import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          'image Ex01'
        ),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/201157139.jpeg'),
                radius: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/201157139.jpeg'),
                      radius: 80,
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/201157139.jpeg'),
                    radius: 80,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}