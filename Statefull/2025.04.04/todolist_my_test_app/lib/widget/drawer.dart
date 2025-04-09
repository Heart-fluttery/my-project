/*
  작성일 2025.04.07 작성자 이학현
  mainscreen.dart에 Drawer를 작성하니 다른 화면으로 이동하면
  Drawer가 사라져서 공통 위젯으로 변경 내용은 딱히 달라진 것 없음
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/user_data.dart';
import 'package:todolist_my_test_app/view/category/accesstodo.dart';
import 'package:todolist_my_test_app/view/category/favorite.dart';
import 'package:todolist_my_test_app/view/category/foodtodo.dart';
import 'package:todolist_my_test_app/view/category/healthtodo.dart';
import 'package:todolist_my_test_app/view/category/pettodo.dart';
import 'package:todolist_my_test_app/view/category/studytodo.dart';
import 'package:todolist_my_test_app/view/page/mainscreen.dart';
import 'package:todolist_my_test_app/view/page/profile.dart';
import 'package:todolist_my_test_app/view/category/remove.dart';
Drawer mainDrawer(BuildContext context, String currentPage){
  return Drawer(
        backgroundColor: Color(0xFFD7C0E6),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFFAF9F7),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      currentPage == 'profile';
                      Get.off(Profile());
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Userdata.imagePath),
                      radius: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Expanded(
                      child: SizedBox(
                        width: 130,
                        child: Text(Userdata.nickName,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.sunny),
              title: Text('To-do List'),
              selected: currentPage == 'todo',
              onTap: () {
                if (currentPage != 'todo'){
                  Get.back();
                  Get.off(Mainscreen());
                }else{
                  Get.back();
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('중요한 일'),
              selected: currentPage == 'star',
              onTap: () {
                if (currentPage != 'star'){
                  Get.back();
                  Get.off(Favorite());
                }else{
                  Get.back();
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('약속 일정'),
              selected: currentPage == 'access',
              onTap: () {
                if (currentPage != 'access'){
                  Get.back();
                  Get.off(Accesstodo());
                }else{
                  Get.back();
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('공부 일정'),
              selected: currentPage == 'study',
              onTap: () {
                if (currentPage != 'study'){
                  Get.back();
                  Get.off(Studytodo());
                }else{
                  Get.back();
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.run_circle_outlined),
              title: Text('운동 일정'),
              selected: currentPage == 'health',
              onTap: () {
                if (currentPage != 'health'){
                  Get.back();
                  Get.off(Healthtodo());
                }else{
                  Get.back();
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.food_bank_outlined),
              title: Text('식사 일정'),
              selected: currentPage == 'food',
              onTap: () {
                if (currentPage != 'food'){
                  Get.back();
                  Get.off(Foodtodo());
                }else{
                  Get.back();
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.pets),
              title: Text('반려동물 일정'),
              selected: currentPage == 'pet',
              onTap: () {
                if (currentPage != 'pet'){
                  Get.back();
                  Get.off(Pettodo());
                }else{
                  Get.back();
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.delete_forever),
              title: Text('휴지통'),
              selected: currentPage == 'trash',
              onTap: () {
                if (currentPage != 'trash'){
                  Get.back();
                  Get.off(Remove());
                }else{
                  Get.back();
                }
              },
            ),
          ],
        ),
      );
}