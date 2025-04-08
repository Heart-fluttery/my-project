/*
  작성일 2025.04.07 작성자 이학현
  휴지통 영구삭제 기능 추가
  
  작성일 2025.04.08 작성자 이학현
  휴지통 복원 기능, 좌우 스와이프 디자인 추가
*/
import 'package:flutter/material.dart';
import 'package:todolist_my_test_app/widget/drawer.dart';
import 'package:todolist_my_test_app/model/todo_data.dart';

class Remove extends StatefulWidget {
  const Remove({super.key});

  @override
  State<Remove> createState() => _RemoveState();
}

class _RemoveState extends State<Remove> {
  final trash = TodoData.trashedTodo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                  setState(() {});
                  if (direction == DismissDirection.endToStart){
                  TodoData.deleteForever(item);
                  // TodoData.todolist.remove(item);
                  // TodoData.trashedTodo.remove(item);
                  // TodoData.todolist.removeWhere((todo) => todo == item);
                  // TodoData.todolist = TodoData.todolist.where((todo) => todo != item).toList();
                  } else if (direction == DismissDirection.startToEnd){
                    trash[index].trashmark = false;
                    setState(() {});
                  }
                  if(TodoData.trashedTodo.isEmpty){
                    trash.clear();
                    setState(() {});
                    return;
                  }
                  // setState(() {});
                },
                background: Container(
                  color: Color(0xFF8BB8E8),
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.restore_from_trash,
                    size: 50,
                  ),
                ),
                secondaryBackground: Container(
                  color: Color(0xFFFF6B6B),
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
                          // 휴지통에서 기능 비활성화
                          // trash[index].comple = !trash[index].comple;
                          // setState(() {});
                        }, 
                        icon: trash[index].comple
                        ?Icon(Icons.check_circle_outline)
                        :Icon(Icons.circle_outlined),
                      ),
                      Icon(trash[index].icon),
                      Expanded(
                        child: Text(
                          trash[index].todo,
                          style: TextStyle(
                            decoration: trash[index].comple
                            ? TextDecoration.lineThrough
                            : null
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // 휴지통에서 기능 비활성화
                          // trash[index].bookmark = !trash[index].bookmark;
                          // setState(() {});
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