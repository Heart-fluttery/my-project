import 'package:flutter/material.dart';
import 'package:tabbar_app/page_1.dart';
import 'package:tabbar_app/page_2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // Tabbar를 모든 화면에 띄우기 위해 with sing~를 추가해줘야함 vsync: this도 이게 있어야 빨간줄 안뜸
  // Property
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    // length = 탭 개수, vsync = 연결지점
  }

  @override
  void dispose() {
    controller.dispose(); // 꺼질 때 메모리 지우는 함수 controller가 위로 와야함
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60, // 앱바 높이 조절 나중에 필요함
        title: Text('Tab Bar Test'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Page1(),
          Page2(),
        ],
      ),
      bottomNavigationBar: Container( // 탭바에 색을 적용하려면 Container로 감싸야함
        color: Colors.amberAccent,
        height: 80,
        child: TabBar( // 같은 컨트롤러를 지정해줘야 같이 작동함
          controller: controller,
          labelColor: Colors.blue, // 선택된 탭바에 적용되는 컬러
          indicatorColor: Colors.redAccent, // 밑에 위치보여주는 선에 적용되는 컬러
          indicatorWeight: 5, // 밑에 선 두께
          tabs: [
            Tab(
              icon: Icon(
                Icons.looks_one,
              ),
              text: "One", // 아이콘 밑에 들어가는 텍스트 String?이라고 뜰 땐 따옴표만 들어가면 됨
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
              ),
              text: "Two",
            ),
          ],
        ),
      ),
    );
  }
}