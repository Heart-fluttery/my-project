import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/model/todo_list.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  // Property
  late List<TodoList> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    addData();
  }
  
  addData(){ // TodoList 모델에서 required this로 지정한 두 값의 데이터를 요구함
    todoList.add(TodoList(imagePath: 'images/cart.png', workList: '책구매')); // [[images/cart.png, 책구매], ]
    todoList.add(TodoList(imagePath: 'images/clock.png', workList: '철수와 약속'));
    todoList.add(TodoList(imagePath: 'images/pencil.png', workList: '스터디 준비하기'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/insert').then((value) => rebuildData());
              // .then 하면 처음으로 안 가고 마지막 지점으로 감
            },
            icon: Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) { 
            // itemBuilder 안에 있는 index는 itemBuilder 안에서 공유
            // Card 하나를 
            return Dismissible(
              direction: DismissDirection.endToStart,
              key: ValueKey(todoList[index]),
              onDismissed: (direction) {
                todoList.remove(todoList[index]);
                setState(() {});
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.delete_forever,
                  size: 50,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Message.workList = todoList[index].workList;
                  // onTap 안에 있기 때문에 클릭했을 때의 index가 넘어감
                  Navigator.pushNamed(context, '/detail');
                },
                child: SizedBox(
                  height: 100,
                  child: Card(
                    color: index % 2 == 0
                    ? Colors.amberAccent
                    : Colors.blueAccent,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            todoList[index].imagePath,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            todoList[index].workList,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  } // build

  // ---- Functions ----
  rebuildData(){
    if (Message.action) {
    todoList.add(TodoList(imagePath: Message.imagePath, workList: Message.workList));
    Message.action = false; // false로 바꿔서 구데이터로 Card 만드는걸 방지
    }
    setState(() {});
  }
} // class