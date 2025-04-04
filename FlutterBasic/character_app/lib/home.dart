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
        foregroundColor: Colors.white,
        centerTitle: true,
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
                  radius: 60,
                ),
              ],
            ),
            Divider(
              color: Colors.red,
            ),
            Text(
              '성웅',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              ),
            Text('이순신 장군',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.white
            ),
            ),
            Text('전적',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            ),
            Text('62전 62승',
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
              fontWeight: FontWeight.bold
            ),
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 3, 0, 0),
                      child: Text('옥포해전',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text('사천포해전',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text('당포해전',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text('한산도대첩',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text('부산포해전',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text('명량해전',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text('노량해전',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/turtle.gif'),
                  radius: 40,
                  backgroundColor: Colors.orangeAccent,
                ),
              ],
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/201157139.jpeg'),
                      radius: 40,
                      backgroundColor: Colors.orangeAccent,
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}