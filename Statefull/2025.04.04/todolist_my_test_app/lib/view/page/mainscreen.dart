/*
  작성일 2025.04.07 작성자 이학현
  메인스크린 & 할 일 목록

  작성일 2025.04.08 작성자 이학현
  list view tap해서 수정 시 내용 바로 보이게 수정 
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/datecontroller.dart';
import 'package:todolist_my_test_app/model/icon_list.dart';
import 'package:todolist_my_test_app/widget/drawer.dart';
import 'package:todolist_my_test_app/model/todo_data.dart';
import 'package:todolist_my_test_app/model/todo_frame.dart';
import 'package:todolist_my_test_app/view/page/tododetail.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  // Property
  late TextEditingController todoController;
  late IconData selecticon;
  late DateTime date;
  late String selectDateText;

  final Datecontroller controller = Get.put(Datecontroller());

  @override
  void initState() {
    super.initState();
    todoController = TextEditingController();
    selecticon = IconList.iconlist[0];
    date = DateTime.now();
    selectDateText = "";
  }

  @override
  Widget build(BuildContext context) {
    final todos = TodoData.activeTodo;

    return Scaffold(
      backgroundColor: Color(0xFFFAF9F7),
      appBar: AppBar(
        centerTitle: true,
        title: Text('To-do List'),
        actions: [
          Image.asset('images/ratedit.gif')
        ],
        backgroundColor: Color(0xFFFAF9F7),
      ),
      body: Center(
        child: todos.isEmpty
        ? Text(
          '아래 버튼을\n눌러\n할 일을 추가해\n보세요\n\n',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF5D5D5D)),
          )
          : ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              // 리스트 스와이프로 삭제 기능
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: ValueKey(todos[index]),
                onDismissed: (direction) {
                  todos[index].trashmark = true;
                  // todos.removeAt(index); // 필터링으로 반환된 리스트라 직접 삭제 X
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
                  onTap: () async {
                    final result = await Get.to(() => Tododetail(), arguments: index);
                    if (result != null){
                    TodoData.todolist[index] =result;
                    setState(() {});
                    }
                    // 수정 내용이 바로 반영이 안 돼서 위같이 수정
                    // Get.to(
                    //   Tododetail(),
                    //   arguments: index
                    // );
                  },
                  child: Card(
                    child:
                    Row(
                      children: [
                        // 완료 버튼
                        IconButton(
                          onPressed: () {
                            todos[index].comple = !todos[index].comple;
                            setState(() {});
                          }, 
                          icon: todos[index].comple
                          ?Icon(Icons.check_circle_outline)
                          :Icon(Icons.circle_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(todos[index].icon),
                        ),
                        Expanded(
                          child: Text(
                            todos[index].todo,
                            style: TextStyle(
                              decoration: todos[index].comple
                              ? TextDecoration.lineThrough
                              : null
                            ),
                            overflow: TextOverflow.ellipsis, // 텍스트가 길어질 때 잘리도록 처리
                          ),
                        ),
                        Text(TodoData.todolist[index].selectedTime),
                        // 중요한 일 버튼
                        IconButton(
                          onPressed: () {
                            todos[index].bookmark = !todos[index].bookmark;
                            setState(() {});
                          }, 
                          icon: todos[index].bookmark
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
      drawer: mainDrawer(context, 'todo'),
      // floatingActionButton도 위젯으로 만들고 싶었는데 생각보다 복잡해서 보류
floatingActionButton: FloatingActionButton(
  onPressed: () {
    Get.bottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          return Container(
            width: double.infinity,
            height: 400,
            color: Color(0xFFD7C0E6),
            child: Stack(
              children: [
                Column(
                  children: [
                    Text(
                      '할 일 추가하기',
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                      child: TextField(
                        controller: todoController,
                        minLines: 1,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: '내용을 입력해 주세요',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      // 화면에 보이는 TodoList
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: IconList.iconlist.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: selecticon == IconList.iconlist[index]
                                ? Color(0xFF8BB8E8)
                                : Color(0xFFFAF9F7),
                            child: IconButton(
                              style: IconButton.styleFrom(
                                minimumSize: Size(60, 50),
                              ),
                              onPressed: () {
                                setState(() {
                                  selecticon = IconList.iconlist[index];
                                });
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
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            dispDatePicker();
                          }, 
                          child: Text('날짜 선택하기'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.resetDate();
                          }, 
                          child: Text('날짜 초기화'),
                        ),
                      ],
                    ),
                    Obx((){
                      return Text(controller.selectDateText.value);
                    })
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
                        } else {
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
                        Get.back();
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
          );
        },
      ),
    );
  },
  child: Icon(
    Icons.add,
    size: 30,
  ),
)

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
                  Get.back();
                },
                child: Text('취소'),
              ),
              ElevatedButton(
                onPressed: () {
                  todoController.clear();
                  Get.back();
                  Get.back();
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
    final text = todoController.text.trim();
    if (text.isNotEmpty){
      TodoData.todolist.add(Todolist(todo: text, selectedTime: selectDateText, icon: selecticon == IconList.iconlist[0]? null : selecticon));
      todoController.clear();
      Get.back();
      setState(() {});
    }
  }
  dispDatePicker() async{
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
      selectDateText = selectedDate.toString().substring(0, 10);
      controller.setDate(selectDateText);
    }
  }
} // class