import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late String calcResult;

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    calcResult = "";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('덧셈 구하기'),
        ),
        body: Column(
          children: [
            TextField(
              controller: num1Controller,
              decoration: InputDecoration(
                labelText: '첫번째 숫자를 입력 하세요',
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: TextField(
                controller: num2Controller,
                decoration: InputDecoration(
                  labelText: '두번째 숫자를 입력 하세요',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: () {
                  calcCheck();
                },
                child: Text('덧셈 계산'),
              ),
            ),
            Text(
              calcResult,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  } // build

  // ---- Functions ----
  calcCheck(){
    if (num1Controller.text.trim().isEmpty || num2Controller.text.trim().isEmpty) {
      errorSnackBar();
    }else{
      int num1 = int.parse(num1Controller.text);
      int num2 = int.parse(num2Controller.text);

      int sum = num1 + num2;
      calcResult = "입력하신 숫자의 합은 $sum 입니다.";
      setState(() {});
    }
  }

  errorSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("너 죽을래? 왜 시키는대로 안해"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
        )
    );
  }
} // class