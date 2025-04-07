import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/drawer.dart';
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
        title: Text('중요한 일'),
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
                  onTap: () {
                    Get.to(
                      Tododetail(),
                      arguments: index
                    );
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
                        Icon(favos[index].icon),
                        Text(
                          favos[index].todo,
                          style: TextStyle(
                            decoration: favos[index].comple
                            ? TextDecoration.lineThrough
                            : null
                          ),
                        ),
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