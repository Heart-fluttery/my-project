/*
  작성일 2025.04.07 작성자 이학현
  중요한 일 목록, mainscree(오늘 할 일)에서 별을 누르면 여기에 복사됨
  내용 수정, 완료 체크 동기화
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/widget/drawer.dart';
import 'package:todolist_my_test_app/model/todo_data.dart';
import 'package:todolist_my_test_app/view/page/tododetail.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _AddlistState();
}

class _AddlistState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final favos = TodoData.favoriteTodo;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('중요한 일'),
        actions: [
          Image.asset('images/ratedit.gif')
        ],
        backgroundColor: Color(0xFFFAF9F7),
      ),
      drawer: mainDrawer(context, 'star'),
      body: Center(
        child: favos.isEmpty
        ? Text(
          '할 일 목록에서\n별을 눌러\n중요한 일을\n체크해 보세요\n\n',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF5D5D5D)),
          )
          : ListView.builder(
            itemCount: favos.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: ValueKey(favos[index]),
                onDismissed: (direction) {
                  favos[index].trashmark = true;
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
                    child:
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            favos[index].comple = !favos[index].comple;
                            setState(() {});
                          }, 
                          icon: favos[index].comple
                          ?Icon(Icons.check_circle_outline)
                          :Icon(Icons.circle_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(favos[index].icon),
                        ),
                        Expanded(
                          child: Text(
                            favos[index].todo,
                            style: TextStyle(
                              decoration: favos[index].comple
                              ? TextDecoration.lineThrough
                              : null
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(TodoData.todolist[index].selectedTime),
                        IconButton(
                          onPressed: () {
                            favos[index].bookmark = !favos[index].bookmark;
                            setState(() {});
                          }, 
                          icon: favos[index].bookmark
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