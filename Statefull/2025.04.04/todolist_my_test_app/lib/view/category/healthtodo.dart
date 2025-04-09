/*
  작성일 2025.04.09 작성자 이학현
  운동 일정 필터 페이지
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/user_data.dart';
import 'package:todolist_my_test_app/widget/drawer.dart';
import 'package:todolist_my_test_app/model/todo_data.dart';
import 'package:todolist_my_test_app/view/page/tododetail.dart';

class Healthtodo extends StatefulWidget {
  const Healthtodo({super.key});

  @override
  State<Healthtodo> createState() => _AddlistState();
}

class _AddlistState extends State<Healthtodo> {
  @override
  Widget build(BuildContext context) {
    final health = TodoData.healthTodo;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('운동 일정',
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
      drawer: mainDrawer(context, 'health'),
      body: Center(
        child: health.isEmpty
        ? Text(
          '운동 일정이\n없습니다\n\n',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xA63F3F3F)),
          )
          : ListView.builder(
            itemCount: health.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: ValueKey(health[index]),
                onDismissed: (direction) {
                  health[index].trashmark = true;
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
                    color: health[index].comple == true? Color(0xFFB8B8B8) : Color(0xFFD7C0E6),
                    child:
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            health[index].comple = !health[index].comple;
                            setState(() {});
                          }, 
                          icon: health[index].comple
                          ?Icon(Icons.check_circle_outline)
                          :Icon(Icons.circle_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(health[index].icon),
                        ),
                        Expanded(
                          child: Text(
                            health[index].todo,
                            style: TextStyle(
                              decoration: health[index].comple
                              ? TextDecoration.lineThrough
                              : null
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(TodoData.todolist[index].selectedTime),
                        IconButton(
                          onPressed: () {
                            health[index].bookmark = !health[index].bookmark;
                            setState(() {});
                          }, 
                          icon: health[index].bookmark
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