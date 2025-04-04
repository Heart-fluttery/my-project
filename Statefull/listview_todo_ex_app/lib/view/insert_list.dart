import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  // Property
  late TextEditingController textEditingController;
  late bool switchNum1; // 구매 스위치
  late bool switchNum2; // 약속 스위치
  late bool switchNum3; // 스터디 스위치

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    switchNum1 = true;
    switchNum2 = false;
    switchNum3 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add View'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '구매',
                ),
            Switch(
              value: switchNum1,
              onChanged: (value) {
                switchNum1 = value;
                switchChange();
                if (switchNum2 == true || switchNum3 == true) {
                  switchNum1 = true;
                  switchNum2 = false;
                  switchNum3 = false;
                }
                setState(() {});
              },
            ),
            Image.asset('images/cart.png'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '약속',
                ),
            Switch(
              value: switchNum2,
              onChanged: (value) {
                switchNum2 = value;
                switchChange();
                if (switchNum1 == true || switchNum3 == true) {
                  switchNum1 = false;
                  switchNum2 = true;
                  switchNum3 = false;
                }
                setState(() {});
              },
            ),
            Image.asset('images/clock.png'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '스터디',
                ),
            Switch(
              value: switchNum3,
              onChanged: (value) {
                switchNum3 = value;
                switchChange();
              },
            ),
            Image.asset('images/pencil.png'),
              ],
            ),
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: '목록을 입력하세요'
              ),
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              onPressed: () {
                if (textEditingController.text.trim().isNotEmpty) {
                  addList();
                }
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  } // build

  // ---- Functions ----
  addList(){
    Message.workList = textEditingController.text;
    if (switchNum1 == true) {
      Message.imagePath = "images/cart.png";
    }else if(switchNum2 == true){
      Message.imagePath = "images/clock.png";
    }else if(switchNum3 == true){
      Message.imagePath = "images/pencil.png";
    }
    Message.action = true;
  } // build

  // ---- Function ----
  switchChange(){
    if (switchNum1 == false && switchNum2 == false && switchNum3 == false) {
      switchNum1 = true;
      setState(() {});
      return;
    }
    switchNum1 = switchNum2 == true || switchNum3 == true ? false : true;
    switchNum2 = switchNum1 == true || switchNum3 == true ? false : true;
    switchNum3 = switchNum1 == true || switchNum2 == true ? false : true;
    setState(() {});
  }
} // class