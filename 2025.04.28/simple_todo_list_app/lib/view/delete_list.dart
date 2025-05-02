import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:simple_todo_list_app/vm/database_handler.dart';

class DeleteList extends StatefulWidget {
  const DeleteList({super.key});

  @override
  State<DeleteList> createState() => _DeleteListState();
}

class _DeleteListState extends State<DeleteList> {
  DatabaseHandler handler = DatabaseHandler();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Lists'),
      ),
      body: FutureBuilder(
        future: handler.querydelTodolist(), 
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    motion: BehindMotion(), 
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        onPressed: (context) async{
                          await handler.deleteTodolist(snapshot.data![index].id!);
                          snapshot.data!.remove(snapshot.data![index]);
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
}