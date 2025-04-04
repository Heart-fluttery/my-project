import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[100],
        toolbarHeight: 500,
        title: Column(
          children: [
            Text('Appbar Icon'),
            Text('----------'),
            Text('----------'),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.email),
            color: Colors.red,
            ),
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.add_alarm),
            color: Colors.green,
            ),
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.add_outlined),
            color: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print('smile image is tapped.');
                },
                child: Image.asset(
                  'images/smile.png',
                  width: 30,
                ),
              ),
            )
        ],
      ),
    );
  }
}