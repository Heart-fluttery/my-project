/*
  작성일 2025.04.09 작성자 이학현
  반려동물 일정 필터 페이지
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/user_data.dart';
import 'package:todolist_my_test_app/widget/drawer.dart';
import 'package:todolist_my_test_app/model/todo_data.dart';
import 'package:todolist_my_test_app/view/page/tododetail.dart';

class Pettodo extends StatefulWidget {
  const Pettodo({super.key});

  @override
  State<Pettodo> createState() => _AddlistState();
}

class _AddlistState extends State<Pettodo> {
  @override
  Widget build(BuildContext context) {
    final pets = TodoData.petTodo;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('반려동물 일정',
        style: TextStyle(
          color: Color(0xFF3F3F3F)
        ),),
        actions: [
          GestureDetector(
            onTap: () {
              Userdata.ratChange = !Userdata.ratChange;
              setState(() {});
            },
            child: Image.asset(
              Userdata.ratChange? 'images/ratedit.gif' : 'images/ratedit_out2.gif',
            ),
          ),
        ],
        backgroundColor: Color(0xFFD7C0E6),
      ),
      drawer: mainDrawer(context, 'pet'),
      body: Center(
        child: pets.isEmpty
        ? Text(
          '반려동물 일정이\n없습니다\n\n',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xA63F3F3F)),
          )
          : ListView.builder(
            itemCount: pets.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: ValueKey(pets[index]),
                onDismissed: (direction) {
                  pets[index].trashmark = true;
                  setState(() {});
                },
                background: Container(
                  color: Color(0xFFFF6B6B),
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete_forever,
                    size: 50,
                  ),
                ),
                child: GestureDetector(
                  onTap: () async {
                    final result = await Get.to(() => Tododetail(), arguments: index);
                    if (result != null) {
                    TodoData.todolist[index] =result;
                    setState(() {});
                    }
                  },
                  child: Card(
                    color: pets[index].comple == true? Color(0xFFB8B8B8) : Color(0xFFD7C0E6),
                    child:
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            pets[index].comple = !pets[index].comple;
                            setState(() {});
                          }, 
                          icon: pets[index].comple
                          ?Icon(Icons.check_circle_outline)
                          :Icon(Icons.circle_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(pets[index].icon),
                        ),
                        Expanded(
                          child: Text(
                            pets[index].todo,
                            style: TextStyle(
                              decoration: pets[index].comple
                              ? TextDecoration.lineThrough
                              : null
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(TodoData.todolist[index].selectedTime),
                        IconButton(
                          onPressed: () {
                            pets[index].bookmark = !pets[index].bookmark;
                            setState(() {});
                          }, 
                          icon: pets[index].bookmark
                          ?Icon(Icons.star)
                          :Icon(Icons.star_border_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
        ),
      ),
    );
  }
}