import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String currentDateTime; // 현재 시간
  DateTime? chosenDateTime; // 선택 시간
  late bool isRunning; // Timer

  @override
  void initState() {
    super.initState();
    currentDateTime = "";
    isRunning = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(!isRunning){
        timer.cancel();
      }
      addItem();
    },
    );
  }

  addItem(){
    final DateTime now = DateTime.now();
    String year = now.year.toString();
    String month = now.month.toString().padLeft(2, '0');
    String day = now.day.toString().padLeft(2, '0');
    int weekday = now.weekday;
    String hour = now.hour.toString();
    String min = now.minute.toString();
    String second = now.second.toString();
    currentDateTime = "$year-$month-$day ${weekdayToString(weekday)} $hour:$min:$second";
    setState(() {});
  }

  String weekdayToString(int weekday){
    String dateName = "";
    switch(weekday){
      case 1:
        dateName = "월";
      case 2:
        dateName = "화";
      case 3:
        dateName = "수";
      case 4:
        dateName = "목";
      case 5:
        dateName = "금";
      case 6:
        dateName = "토";
      case 7:
        dateName = "일";
    }
    return dateName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "현재 시간 : $currentDateTime",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              width: 300,
              height: 200,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                use24hFormat: false,
                onDateTimeChanged: (value) { // value는 사용자가 선택한 시간
                  chosenDateTime = value;
                  setState(() {});
                },
              ),
            ),
            Text(
              '선택시간 : ${chosenDateTime != null ? chosenItem(chosenDateTime!) : '시간을 선택하세요'}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  } // build

    String chosenItem(DateTime now){
    String year = now.year.toString();
    String month = now.month.toString().padLeft(2, '0');
    String day = now.day.toString().padLeft(2, '0');
    int weekday = now.weekday;
    String hour = now.hour.toString();
    String min = now.minute.toString();
    String chosenDateTime1 = "$year-$month-$day ${weekdayToString(weekday)} $hour:$min";
    return chosenDateTime1;
  }

} // class