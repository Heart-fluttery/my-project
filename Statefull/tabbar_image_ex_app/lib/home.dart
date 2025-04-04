import 'package:flutter/material.dart';
import 'package:tabbar_image_ex_app/page_1.dart';
import 'package:tabbar_image_ex_app/page_2.dart';

import 'page_3.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late TabController controller;
  late List<String> imagesName;
  late int currentImage;

  @override
  void initState() {
    super.initState();
  controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이미지 변경하기'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Page1(),
          Page2(),
          Page3(),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: [
          Tab(
            icon: Icon(
              Icons.card_giftcard,
            ),
            text: "Button",
          ),
          Tab(
            icon: Icon(
              Icons.print,
            ),
            text: "Swipe",
          ),
          Tab(
            icon: Icon(
              Icons.timer,
            ),
            text: "Timer",
          ),
        ],
      ),
    );
  }
}