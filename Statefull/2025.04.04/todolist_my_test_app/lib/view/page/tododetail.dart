/*
  작성일 2025.04.07 작성자 이학현
  일정 클릭 시 나오는 수정가능한 정보페이지
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/todo_data.dart';

class Tododetail extends StatefulWidget {
  const Tododetail({super.key});

  @override
  State<Tododetail> createState() => _TododetailState();
}

class _TododetailState extends State<Tododetail> {
  // Property
  var value = Get.arguments ?? "";
  late TextEditingController editTodo; // 일정 수정 키보드

  @override
  void initState() {
    super.initState();
    editTodo = TextEditingController();
    editTodo.text = TodoData.todolist[value].todo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('일정 수정하기'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: editTodo,
              keyboardType: TextInputType.text,
              minLines: 1,
              maxLines: 3,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    editTodo.clear();
                    Get.back();
                  },
                  child: Text('취소'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (editTodo.text.trim().isEmpty){
                      Get.snackbar('저장 할 수 없습니다', '내용을 입력해 주세요');
                    }else{
                      TodoData.todolist[value].todo = editTodo.text.trim();
                      Get.back();
                    }
                  },
                  child: Text('저장'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}