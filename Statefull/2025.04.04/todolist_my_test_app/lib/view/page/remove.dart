/*
작성일 2025.04.07 작성자 이학현
내용 휴지통 영구삭제 기능 추가
*/
import 'package:flutter/material.dart';
import 'package:todolist_my_test_app/model/drawer.dart';
import 'package:todolist_my_test_app/model/todo_data.dart';

class Remove extends StatefulWidget {
  const Remove({super.key});

  @override
  State<Remove> createState() => _RemoveState();
}

class _RemoveState extends State<Remove> {
  final trash = TodoData.trashedTodo;
  DismissDirection? nowdirection; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('휴지통'),
      ),
      drawer: mainDrawer(context, 'trash'),
      body: Center(
        child: trash.isEmpty
        ? Text(
          '휴지통이\n비어있습니다\n\n',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF5D5D5D)),
          )
          : ListView.builder(
            itemCount: trash.length,
            itemBuilder: (context, index) {
              var item = TodoData.trashedTodo[index];
              return Dismissible(
                direction: DismissDirection.horizontal,
                key: ValueKey(item.todo),
                onDismissed: (direction) {
                  nowdirection = direction;
                  setState(() {});
                  if (direction == DismissDirection.endToStart){
                  TodoData.deleteForever(item);
                  // TodoData.todolist.remove(item);
                  // TodoData.trashedTodo.remove(item);
                  // TodoData.todolist.removeWhere((todo) => todo == item);
                  // TodoData.todolist = TodoData.todolist.where((todo) => todo != item).toList();
                  if(TodoData.trashedTodo.isEmpty){
                    trash.clear();
                    setState(() {});
                    return;
                  }
                  } else if (direction == DismissDirection.startToEnd){
                    //복구
                  }
                  // setState(() {});
                },
                background: Container(
                  color: (nowdirection == DismissDirection.endToStart)
                  ?Color(0xFFFF6B6B)
                  :Color(0xFF8BB8E8),
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete_forever,
                    size: 50,
                  ),
                ),
                child: Card(
                  child:
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          trash[index].comple = !trash[index].comple;
                          setState(() {});
                        }, 
                        icon: trash[index].comple
                        ?Icon(Icons.check_circle_outline)
                        :Icon(Icons.circle_outlined),
                      ),
                      Icon(trash[index].icon),
                      Text(
                        trash[index].todo,
                        style: TextStyle(
                          decoration: trash[index].comple
                          ? TextDecoration.lineThrough
                          : null
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          trash[index].bookmark = !trash[index].bookmark;
                          setState(() {});
                        }, 
                        icon: trash[index].bookmark
                        ?Icon(Icons.star)
                        :Icon(Icons.star_border_outlined),
                      ),
                    ],
                  ),
                ),
              );
            },
        ),
      ),
    );
  }
}