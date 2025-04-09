/*
  작성일 2025.04.09 작성자 이학현
  약속 일정 필터 페이지
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/user_data.dart';
import 'package:todolist_my_test_app/widget/drawer.dart';
import 'package:todolist_my_test_app/model/todo_data.dart';
import 'package:todolist_my_test_app/view/page/tododetail.dart';

class Accesstodo extends StatefulWidget {
  const Accesstodo({super.key});

  @override
  State<Accesstodo> createState() => _AddlistState();
}

class _AddlistState extends State<Accesstodo> {
  @override
  Widget build(BuildContext context) {
    final access = TodoData.accessTodo;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('약속 일정',
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
      drawer: mainDrawer(context, 'access'),
      body: Center(
        child: access.isEmpty
        ? Text(
          '약속 일정이\n없습니다\n\n',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xA63F3F3F)),
          )
          : ListView.builder(
            itemCount: access.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: ValueKey(access[index]),
                onDismissed: (direction) {
                  access[index].trashmark = true;
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
                    color: access[index].comple == true? Color(0xFFB8B8B8) : Color(0xFFD7C0E6),
                    child:
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            access[index].comple = !access[index].comple;
                            setState(() {});
                          }, 
                          icon: access[index].comple
                          ?Icon(Icons.check_circle_outline)
                          :Icon(Icons.circle_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(access[index].icon),
                        ),
                        Expanded(
                          child: Text(
                            access[index].todo,
                            style: TextStyle(
                              decoration: access[index].comple
                              ? TextDecoration.lineThrough
                              : null
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(TodoData.todolist[index].selectedTime),
                        IconButton(
                          onPressed: () {
                            access[index].bookmark = !access[index].bookmark;
                            setState(() {});
                          }, 
                          icon: access[index].bookmark
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