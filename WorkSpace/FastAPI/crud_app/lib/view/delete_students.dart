import 'dart:convert';

import 'package:crud_app/model/student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DeleteStudents extends StatefulWidget {
  const DeleteStudents({super.key});

  @override
  State<DeleteStudents> createState() => _DeleteStudentsState();
}

class _DeleteStudentsState extends State<DeleteStudents> {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController deptController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  late Student student;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments ?? "__";
    student = Student(
      code: args[0], 
      name: args[1], 
      dept: args[2], 
      phone: args[3], 
      address: args[4]
    );

    codeController.text = student.code;
    nameController.text = student.name;
    deptController.text = student.dept;
    phoneController.text = student.phone;
    addressController.text = student.address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete for CRUD"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextField(codeController, "학번"),
            _buildTextField(nameController, "성명"),
            _buildTextField(deptController, "전공"),
            _buildTextField(phoneController, "전화번호"),
            _buildTextField(addressController, "주소"),
            ElevatedButton(
              onPressed: () => deleteStudent(), 
              child: Text('삭제'),
            ),
          ],
        ),
      ),
    );
  } // build

  // --- Widgets ---
  // Flutter에서의 파라미터 기본값 설정 {}로 감싸기
  Widget _buildTextField(TextEditingController controller, String labelText){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: labelText),
        keyboardType: TextInputType.text,
        readOnly: true,
      ),
    );
  }



  // --- Functions ---
  deleteStudent()async{
    try{
      final url = Uri.parse('http://127.0.0.1:8000/delete');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'code' : student.code})
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
        title: "삭제 결과",
        middleText:  "삭제가 완료 되었습니다",
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