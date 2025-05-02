import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:simple_todo_list_app/model/todolist.dart';
import 'package:simple_todo_list_app/view/delete_list.dart';
import 'package:simple_todo_list_app/vm/database_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DatabaseHandler handler = DatabaseHandler();
  late TextEditingController todoController;
  late TextEditingController editController;

  @override
  void initState() {
    super.initState();
    todoController = TextEditingController();
    editController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Lists'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(DeleteList());
            }, 
            icon: Icon(Icons.delete_outline),
          ),
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Todo List',
                content: Column(
                  children: [
                    TextField(
                      controller: todoController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: '추가할 내용'
                      ),
                    ),
                    Row(
                      children: [
                    ElevatedButton(
                      onPressed: () {
                        todoController.clear();
                        Get.back();
                      },
                      child: Text('취소'),
                    ),
                        ElevatedButton(
                          onPressed: () async{
                            Todolist todolist = Todolist(
                              todo: todoController.text, 
                              date: DateTime.now().toString());
                              int result = await handler.insertTodolist(todolist);
                              if(result == 0){
                                errorSnackBar();
                              }else{
                                showDialog();
                              }
                              setState(() {});
                              todoController.clear();
                          }, 
                          child: Text('추가하기'),
                        ),
                      ],
                    ),
                  ],
                )
              );
            }, 
            icon: Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: handler.queryTodolist(), 
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                      title: '수정하기',
                      content: Column(
                        children: [
                          TextField(
                            controller: editController,
                            decoration: InputDecoration(
                              labelText: '수정할 내용'
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                              Get.back();
                              editController.clear();
                            },
                            child: Text('취소'),
                          ),
                          ElevatedButton(
                            onPressed: () async{
                            Todolist todolist = Todolist(
                              todo: snapshot.data![index].todo, 
                              date: DateTime.now().toString());
                              int result = await handler.updateTodolist(todolist);
                              if(result == 0){
                                errorSnackBar();
                              }else{
                                showDialog();
                              }
                              setState(() {});
                              editController.clear();
                          }, 
                            child: Text('저장'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: BehindMotion(), 
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          onPressed: (context) async{
                            await handler.moveTodoToDeleteList(snapshot.data![index].id!);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    child: Card(
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text('${snapshot.data![index].todo} / '),
                          Text(snapshot.data![index].date.substring(0,10)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  errorSnackBar(){
    Get.snackbar(
      "경고", 
      "입력 중 문제가 발생했습니다",
      colorText: Theme.of(context).colorScheme.onError,
      backgroundColor: Theme.of(context).colorScheme.error,
      );
  }

  showDialog(){
    Get.defaultDialog(
      title: '입력 결과',
      middleText: '입력이 완료되었습니다.',
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          }, 
          child: Text('나가기'),
        ),
      ]
    );
  }
  reloadData(){
    handler.queryTodolist();
    setState(() {});
}
}