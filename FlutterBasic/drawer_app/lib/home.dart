import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.shopping_cart),
            ),
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.search),
            ),
        ],
      ),
      body: Center(
        child: Text('Drawer'),
      ),

      drawer: Drawer(
        child: ListView( // 유튜브나 당근마켓같은 형식
        padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/201157139.jpeg'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-2.png'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-3.png'),
                ),
              ],
              accountName: Text('Heart-Flutter'),
              accountEmail: Text('heartflutter@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: Text('Home'),
              onTap: () {
                print('Home is clicked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text('설정'),
              onTap: () {
                print('Settings is clicked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
              ),
              title: Text('자주 묻는 질문'),
              onTap: () {
                print('question is clicked');
              },
              iconColor: Colors.red,
            ),
          ],
        ) 
      ),
    );
  }
}