import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Buttons'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'images/201157139.jpeg',
                  width: 150,
                  ),
                Image.asset(
                  'images/em.webp',
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill,
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'images/cm.webp',
                    width: 150,
                    ),
                  Image.asset(
                    'images/KM.webp',
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => print('cute puppy'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(156, 114, 99, 1),
                    maximumSize: Size(130, 40),
                    foregroundColor: Colors.white
                  ),
                  child: Text("Cute Puppy"),
                  ),
                ElevatedButton(
                  onPressed: () => print('Elmo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    minimumSize: Size(130, 40),
                    foregroundColor: Colors.white
                  ),
                  child: Text("EM"),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => print('Cookie Monster'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      minimumSize: Size(130, 40),
                      foregroundColor: Colors.white
                    ),
                    child: Text("CM"),
                    ),
                  ElevatedButton(
                    onPressed: () => print('Kermit the Frog'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(130, 40),
                      foregroundColor: Colors.white,
                    ),
                    child: Text("KM"),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}