/*
  작성일 2025.04.09 작성자 이학현
  식사 일정 필터 페이지
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/user_data.dart';
import 'package:todolist_my_test_app/widget/drawer.dart';
import 'package:todolist_my_test_app/model/todo_data.dart';
import 'package:todolist_my_test_app/view/page/tododetail.dart';

class Foodtodo extends StatefulWidget {
  const Foodtodo({super.key});

  @override
  State<Foodtodo> createState() => _AddlistState();
}

class _AddlistState extends State<Foodtodo> {
  @override
  Widget build(BuildContext context) {
    final food = TodoData.foodTodo;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('식사 일정',
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
      drawer: mainDrawer(context, 'food'),
      body: Center(
        child: food.isEmpty
        ? Text(
          '식사 일정이\n없습니다\n\n',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xA63F3F3F)),
          )
          : ListView.builder(
            itemCount: food.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: ValueKey(food[index]),
                onDismissed: (direction) {
                  food[index].trashmark = true;
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
                    color: food[index].comple == true? Color(0xFFB8B8B8) : Color(0xFFD7C0E6),
                    child:
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            food[index].comple = !food[index].comple;
                            setState(() {});
                          }, 
                          icon: food[index].comple
                          ?Icon(Icons.check_circle_outline)
                          :Icon(Icons.circle_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(food[index].icon),
                        ),
                        Expanded(
                          child: Text(
                            food[index].todo,
                            style: TextStyle(
                              decoration: food[index].comple
                              ? TextDecoration.lineThrough
                              : null
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(TodoData.todolist[index].selectedTime),
                        IconButton(
                          onPressed: () {
                            food[index].bookmark = !food[index].bookmark;
                            setState(() {});
                          }, 
                          icon: food[index].bookmark
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