import 'package:collection_view_image_app/view/detail_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> imageName;

  @override
  void initState() {
    super.initState();
    imageName = [
      'images/flower_01.png',
      'images/flower_02.png',
      'images/flower_03.png',
      'images/flower_04.png',
      'images/flower_05.png',
      'images/flower_06.png',
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flower Garden'),
      ),
      body: GridView.builder(
        itemCount: imageName.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ), 
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.to(DetailImage(), arguments: imageName[index]),
            child: Card(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          imageName[index],
                          width: 100,
                        ),
                      ),
                      Text(
                        imageName[index].substring(7),
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  RotationTransition(
                    turns: AlwaysStoppedAnimation(310/360),
                    child: Text(
                      'ALL rights reserved!',
                      style: TextStyle(
                        color: Colors.redAccent
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}