/*
  작성일 2025.04.07 작성자 이학현
  일정 클릭 시 나오는 수정가능한 정보페이지
  파일명은 tododetail 이지만 이후 수정하기로 바꿈
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/icon_list.dart';
import 'package:todolist_my_test_app/model/todo_data.dart';
import 'package:todolist_my_test_app/model/user_data.dart';

class Tododetail extends StatefulWidget {
  const Tododetail({super.key});

  @override
  State<Tododetail> createState() => _TododetailState();
}

class _TododetailState extends State<Tododetail> {
  // Property
  var value = Get.arguments ?? "";
  late IconData? editicon;
  late TextEditingController editTodo; // 일정 수정 키보드

  @override
  void initState() {
    super.initState();
    editTodo = TextEditingController();
    editTodo.text = TodoData.todolist[value].todo;
    editicon = TodoData.todolist[value].icon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF9F7),
      appBar: AppBar(
        title: Text('일정 수정하기',
        style: TextStyle(
          color: Color(0xFF3F3F3F)
        ),),
        actions: [
          GestureDetector(
            onTap: () {
              Userdata.ratChange = !Userdata.ratChange;
              setState(() {});
            },
            child: Image.asset(
              Userdata.ratChange? 'images/ratedit.gif' : 'images/ratedit_out2.gif',
            ),
          ),
        ],
        backgroundColor: Color(0xFFD7C0E6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                  controller: editTodo,
                  keyboardType: TextInputType.text,
                  minLines: 1,
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: IconList.iconlist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: editicon == IconList.iconlist[index]? Color(0xFF8BB8E8) : Color(0xFFFAF9F7),
                        child: IconButton(
                          style: IconButton.styleFrom(
                            minimumSize: Size(60, 50),
                          ),
                          onPressed: () {
                            editicon = index == 0? null : IconList.iconlist[index];
                            setState(() {});
                          },
                          icon: Icon(
                            IconList.iconlist[index],
                            size: 40,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        dispDatePicker();
                      }, 
                      child: Text('날짜 선택하기',
                          style: TextStyle(
                            color: Color(0xFF3F3F3F)
                          ),),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                        TodoData.todolist[value].selectedTime = "";
                        });
                      }, 
                      child: Text('날짜 초기화',
                          style: TextStyle(
                            color: Color(0xFF3F3F3F)
                          ),),
                    ),
                  ],
                ),
                Text(TodoData.todolist[value].selectedTime),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF6B6B)
                      ),
                      onPressed: () {
                        editTodo.clear();
                        Get.back();
                      },
                      child: Text('취소',
                          style: TextStyle(
                            color: Color(0xFFFAF9F7)
                          ),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8BB8E8)
                      ),
                      onPressed: () {
                        if (editTodo.text.trim().isEmpty){
                          Get.snackbar('저장 할 수 없습니다', '내용을 입력해 주세요');
                        }else{
                          TodoData.todolist[value].todo = editTodo.text.trim();
                          TodoData.todolist[value].icon = editicon;
                          Get.back(result: TodoData.todolist[value]);
                          setState(() {});
                        }
                      },
                      child: Text('저장',
                          style: TextStyle(
                            color: Color(0xFF3F3F3F)
                          ),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

    dispDatePicker() async{
    DateTime date = DateTime.now();
    int firstYear = date.year - 1;
    int lastYear = firstYear + 5;
    final selectedDate = await showDatePicker(
      context: context, 
      firstDate: DateTime(firstYear), 
      lastDate: DateTime(lastYear),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      locale: Locale('ko', 'KR'),
    );
    if(selectedDate != null){
      TodoData.todolist[value].selectedTime = selectedDate.toString().substring(0, 10);
      setState(() {});
    }
  }

}