import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  // Property
  late DateTime date;
  late String selectDateText;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    selectDateText = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // '현재 일자는 : ${date.toString()}'
              '현재 일자는 : ${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} 입니다.'
            ),
            ElevatedButton(
              onPressed: () => dispDatePicker(), 
              child: Text('Date Picker'), // 캘린더 불러오는걸 Date Picker라고 함
            ),
            Text(selectDateText)
          ],
        ),
      ),
    );
  } // build

  // ---- Functions ----
  dispDatePicker() async{
    // print(date.year);
    int firstYear = date.year - 1;
    int lastYear = firstYear + 5;
    final selectedDate = await showDatePicker(
      // await 쓰는 이유는 날짜를 선택할 때까지 기다려야해서
      context: context, 
      initialDate: date,
      firstDate: DateTime(firstYear), 
      lastDate: DateTime(lastYear),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      locale: Locale('ko', 'KR'),
    );
    if(selectedDate != null){
      selectDateText = '선택 하신 일자는 ${selectedDate.toString().substring(0, 10)} 입니다.';
      setState(() {});
    }
  }
} // class