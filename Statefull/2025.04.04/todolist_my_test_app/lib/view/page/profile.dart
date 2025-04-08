import 'package:flutter/material.dart';
import 'package:todolist_my_test_app/widget/drawer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 정보'),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/201157139.jpeg'),
              radius: 160,
            )
          ],
        ),
      ),
      drawer: mainDrawer(context, 'profile'),
    );
  }
}