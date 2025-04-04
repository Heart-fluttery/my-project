import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late TextEditingController num3Controller;
  late TextEditingController num4Controller;
  late TextEditingController num5Controller;
  late TextEditingController num6Controller;

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    num3Controller = TextEditingController();
    num4Controller = TextEditingController();
    num5Controller = TextEditingController();
    num6Controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("간단한 계산기"),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: num1Controller,
                  decoration: InputDecoration(
                    labelText: '첫번째 숫자를 입력하세요',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: TextField(
                    controller: num2Controller,
                    decoration: InputDecoration(
                      labelText: '두번째 숫자를 입력하세요',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          calcResult();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('계산하기',
                        style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controllerReset();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('지우기',
                      style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: TextField(
                    controller: num3Controller,
                  readOnly: true,
                    decoration: InputDecoration(
                      labelText: '덧셈 결과',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
                TextField(
                  controller: num4Controller,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: '뺄셈 결과',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: TextField(
                    controller: num5Controller,
                  readOnly: true,
                    decoration: InputDecoration(
                      labelText: '곱셈 결과',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
                TextField(
                  controller: num6Controller,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: '나눗셈 결과',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } // build

  // ---- Functions ----
  calcResult(){
    if (num1Controller.text.trim().isEmpty || num2Controller.text.trim().isEmpty) {
      errorSnackBar();
    }else{
    int num1 = int.parse(num1Controller.text);
    int num2 = int.parse(num2Controller.text);
    int result1 = num1 + num2;
    int result2 = num1 - num2;
    int result3 = num1 * num2;
    double result4 = num1 / num2;
    num3Controller.text = result1.toString();
    num4Controller.text = result2.toString();
    num5Controller.text = result3.toString();
    num6Controller.text = result4.toString();
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

  controllerReset(){
    num1Controller.text = "";
    num2Controller.text = "";
    num3Controller.text = "";
    num4Controller.text = "";
    num5Controller.text = "";
    num6Controller.text = "";
  }
} // class
