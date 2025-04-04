import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text('영웅 Card'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/Lee.jpg'),
                  radius: 50,
                ),
              ],
            ),
            Divider(
              color: Colors.red,
            ),
            Text('성웅',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
            Text('이순신 장군',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40
            ),),
            Text('전적',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            ),
            Text('62전 62승',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('   옥포해전'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('   사천포해전'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('   당포해전'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('   한산도대첩'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('   부산포해전'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('   명량해전'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Text('   노량해전'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/turtle.gif'),
                  backgroundColor: Colors.orangeAccent,
                  radius: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}