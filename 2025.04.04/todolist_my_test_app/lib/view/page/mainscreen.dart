import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/todo_frame.dart';

/*
  작성
*/
class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  // Property
  late List <Todolist> todolist;
  late TextEditingController todoController;

  @override
  void initState() {
    super.initState();
    todolist = [];
    todoController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('오늘 할 일'),
      ),
      body: Center(
        child: todolist.isEmpty
        ? Text(
          '아래 버튼을\n눌러\n할 일을 추가해\n보세요\n\n',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF5D5D5D)),
          )
          : ListView.builder(
            itemCount: todolist.length,
            itemBuilder: (context, index) {
              return Card(
                child:
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        //
                      }, 
                      icon: todolist[index].comple
                      ?Icon(Icons.check_circle_outline)
                      :Icon(Icons.circle_outlined),
                    ),
                    Icon(todolist[index].icon as IconData?),
                    Text(todolist[index].todo),
                    IconButton(
                      onPressed: () {
                        //
                      }, 
                      icon: todolist[index].bookmark
                      ?Icon(Icons.star)
                      :Icon(Icons.star_border_outlined),
                    ),
                  ],
                ),
              );
            },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            Container(
              width: 500,
              height: 300,
              color: Colors.grey,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Text(
                        '할 일 추가하기',
                        style: TextStyle(fontSize: 20),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: todoController,
                          minLines: 1,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: '내용을 입력해 주세요',
                            hintStyle: TextStyle(color: Colors.white)
                            // labelText: '내용을 입력해 주세요', // hintText로 변경
                            // labelStyle: TextStyle(
                            //   color: Colors.white
                            // )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 30),
                      child: ElevatedButton(
                        onPressed: () {
                          if (todoController.text.trim().isNotEmpty) {
                            removeDialog();
                          }else{
                            Get.back();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF6B6B),
                        ),
                        child: Text('취소'),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 30, 30),
                      child: ElevatedButton(
                        onPressed: () {
                          addtodolist();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF8BB8E8),
                        ),
                        child: Text('저장'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  } //  build

  // ---- Functions ----
  removeDialog(){
    Get.defaultDialog(
      title: '작성 중인 내용이 있습니다',
      titleStyle: TextStyle(
        fontSize: 20,
      ),
      content: Column(
        children: [
          Text('내용을 삭제하시겠습니까?',
          style: TextStyle(fontSize: 17),),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  //
                },
                child: Text('취소'),
              ),
              ElevatedButton(
                onPressed: () {
                  //
                },
                child: Text('삭제'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  addtodolist(){
    
  }
} // class