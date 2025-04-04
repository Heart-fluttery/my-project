import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text("Image01"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              CircleAvatar( 
                backgroundImage: AssetImage(
                  'images/201157139.jpeg'
                ),
                radius: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/201157139.jpeg'
                  ),
                  radius: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/pikachu-2.png'
                  ),
                  radius: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/pikachu-3.png'
                  ),
                  radius: 80,
                ),
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'images/201157139.jpeg'
                ),
                radius: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/201157139.jpeg'
                  ),
                  radius: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}