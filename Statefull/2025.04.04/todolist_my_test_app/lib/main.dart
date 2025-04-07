import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:todolist_my_test_app/view/page/favorite.dart';
// import 'package:todolist_my_test_app/view/page/remove.dart';
// import 'package:todolist_my_test_app/view/page/mainscreen.dart';
// import 'package:todolist_my_test_app/view/page/tododetail.dart';
import 'view/page/home.dart';
/*
  작성일 2025.04.04 작성자 이학현
  각 페이지 Get.page로 만들었다가 필요없는 것 같아서 주석처리
*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(),
      // getPages: [
      //   GetPage(
      //     name: '/',
      //     page: () => Mainscreen(),
      //   ),
      //   GetPage(
      //     name: '/favorite',
      //     page: () => Favorite(),
      //   ),
      //   GetPage(
      //     name: '/remove',
      //     page: () => Remove(),
      //   ),
      //   GetPage(
      //     name: '/detail',
      //     page: () => Tododetail(),
      //   ),
      // ],
    );
  }
}