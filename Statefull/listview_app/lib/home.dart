import 'package:flutter/material.dart';
import 'package:listview_app/model/model.dart';
import 'package:listview_app/view/page_1.dart';
import 'package:listview_app/view/page_2.dart';
/*
  작성일 2025.04.02 작성자 이학현
  2페이지 탭바 제작
*/
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  // Property
  late TabController controller; // 하단 탭바
  late List<AnimalList> animalList; // 동물 정보, 원래 page_1에서 지정했는데
  // 탭바에서 변수를 지정해서 연결된 클래스에서 쓸 수 있게 함

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    animalList = [];
    addData();
  }

  addData(){
    animalList.add(AnimalList(imagePath: 'images/bee.png', animalName: '벌', order: '파충류', fly: true));
    animalList.add(AnimalList(imagePath: 'images/cat.png', animalName: '고양이', order: '포유류', fly: false));
    animalList.add(AnimalList(imagePath: 'images/cow.png', animalName: '젖소', order: '포유류', fly: false));
    animalList.add(AnimalList(imagePath: 'images/dog.png', animalName: '개', order: '포유류', fly: false));
    animalList.add(AnimalList(imagePath: 'images/fox.png', animalName: '여우', order: '포유류', fly: false));
    animalList.add(AnimalList(imagePath: 'images/monkey.png', animalName: '원숭이', order: '영장류', fly: false));
    animalList.add(AnimalList(imagePath: 'images/pig.png', animalName: '돼지', order: '포유류', fly: false));
    animalList.add(AnimalList(imagePath: 'images/wolf.png', animalName: '늑대', order: '포유류', fly: false));
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar( // Tabbar 구성이라 appBar 필요없는데 넣어버림
      //   title: Text('Listview Test'),
      //   backgroundColor: Colors.blueAccent,
      //   foregroundColor: Colors.white,
      //   centerTitle: true,
      // ),
      body: TabBarView(
        controller: controller,
        children: [
          Page1(list: animalList,),
          Page2(list: animalList,),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.amberAccent,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blueAccent,
          unselectedLabelColor: Colors.redAccent,
          indicatorColor: Colors.redAccent,
          tabs: [
            Tab(
              icon: Icon(
                Icons.looks_one,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
              ),
            ),
          ],
        ),
      ),
    );
  }
}