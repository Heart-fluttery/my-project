import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_todo_list_app/model/todolist.dart';
import 'package:http/http.dart' as http;

class AddTodolist extends StatefulWidget {
  const AddTodolist({super.key});

  @override
  State<AddTodolist> createState() => _AddTodolistState();
}

class _AddTodolistState extends State<AddTodolist> {
  final TextEditingController contentsController = TextEditingController();
  final List imageName = ['images/cart.png', 'images/clock.png', 'images/pencil.png'];
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add View"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: Image.asset(imageName[selectedItem],fit: BoxFit.fill,)),
                    ),
                    Container(
                      color: const Color.fromARGB(255, 162, 255, 167),
                      width: 150,
                      height: 150,
                      child: CupertinoPicker(
                        itemExtent: 50, 
                        scrollController: FixedExtentScrollController(initialItem: 0),
                        onSelectedItemChanged: (value) {
                          selectedItem = value;
                          setState(() {});
                        }, 
                        children: List.generate(
                          imageName.length, 
                          (index) => Center(
                            child: Image.asset(imageName[index],width: 50,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildTextField(contentsController, "내용을 입력하세요"),
              ElevatedButton(
                onPressed: () => insertTodolist(), 
                child: Text('입력'),
              ),
            ],
          ),
        ),
      ),
    );
  } // build

  // --- Widgets ---
  Widget _buildTextField(TextEditingController controller, String labelText){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: labelText),
        keyboardType: TextInputType.text,
      ),
    );
  }



  // --- Functions ---
  insertTodolist()async{
    try{
      final todolist = Todolist(
        contents: contentsController.text, 
        image: imageName[selectedItem], 
        insertdate: DateTime.now().toString()
      );
      final url = Uri.parse('http://127.0.0.1:8000/insert');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(todolist.toJSON())
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
  }// class