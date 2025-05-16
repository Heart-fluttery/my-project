import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_todo_list_app/model/todolist.dart';
import 'package:image_todo_list_app/view/add_todolist.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todolist> data = [];

  @override
  void initState() {
    super.initState();
    getJSONData(); // 첫 화면에서 DB 불러서 가져오기
  }

  getJSONData()async{
    var url = Uri.parse("http://127.0.0.1:8000/select");
    var response = await http.get(url);

    data.clear();
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    data = result.map((e) => Todolist.fromJson(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD for Todolist'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                ()=>AddTodolist()
              )!.then((value) => getJSONData());
            }, 
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SizedBox(
        child: Center(
          child: data.isEmpty
          ? Text(
            '데이터가 없습니다.',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          )
          : ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final todolist = data[index];
              return Card(
                color: index % 2 == 0? const Color.fromRGBO(170, 183, 255, 1) : const Color.fromRGBO(219, 168, 255, 1),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                      child: Image.asset(todolist.image),
                    ),
                    Text("${todolist.contents} / ${todolist.insertdate}")
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  } // build

  // --- Widgets ---
  // Widget _buildRow(String label, String value){
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Row(
  //       children: [
  //         Text(
  //           label,
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold
  //           ),
  //         ),
  //         Text(value)
  //       ],
  //     ),
  //   );
  // }

  // --- Functions ---
    deleteStudent(seq)async{
    try{
      final url = Uri.parse('http://127.0.0.1:8000/delete');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'seq' : seq})
      );

      final data = json.decode(utf8.decode(response.bodyBytes));
      final result = data['result'];

      if(result == "OK"){
        _showDialog();
      }else{
        errorSnackBar();
      }
    }catch(e){
      errorSnackBar();
    }
  }

    _showDialog(){
      Get.defaultDialog(
        title: "입력 결과",
        middleText:  "입력이 완료 되었습니다",
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.back();
            }, 
            child: Text('OK'),
          ),
        ]
      );
    }

    errorSnackBar(){
      Get.snackbar(
        'Error', 
        '에러가 발생했습니다',
      );
    }

} // class