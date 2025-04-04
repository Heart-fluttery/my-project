import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1Controller; // 숫자 1 입력 (숫자키보드)
  late TextEditingController num2Controller; // 숫자 2 입력 (숫자키보드)
  late TextEditingController addController; // 덧셈 출력
  late TextEditingController subController; // 뺄셈 출력
  late TextEditingController mulController; // 곱셈 출력
  late TextEditingController divController; // 나눗셈 출력
  late bool addswitch; // 덧셈 스위치
  late bool subswitch; // 뺄셈 스위치
  late bool mulswitch; // 곱셈 스위치
  late bool divswitch; // 나눗셈 스위치
  late int mainadd; // 덧셈 결과
  late int mainsub; // 뺄셈 결과
  late int mainmul; // 곱셈 결과
  late double maindiv; // 나눗셈 결과

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    addController = TextEditingController();
    subController = TextEditingController();
    mulController = TextEditingController();
    divController = TextEditingController();
    addswitch = true;
    subswitch = true;
    mulswitch = true;
    divswitch = true;
    mainadd = 0;
    mainsub = 0;
    mainmul = 0;
    maindiv = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(210, 210, 210, 1),
        appBar: AppBar(
          title: Text('간단한 계산기'),
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
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: const Color.from(alpha: 1, red: 1, green: 0.929, blue: 0.667)
                  ),
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: TextField(
                    controller: num2Controller,
                    decoration: InputDecoration(
                      labelText: '두번째 숫자를 입력하세요',
                      border: OutlineInputBorder(),
                    filled: true,
                    fillColor: const Color.from(alpha: 1, red: 1, green: 0.929, blue: 0.667)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          calcResult();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        child: Text('계산하기'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        removeAll();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      child: Text('지우기'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('덧셈',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                          child: Switch(
                            value: addswitch,
                            activeColor: Colors.amberAccent,
                            activeTrackColor: const Color.fromARGB(255, 255, 255, 255),
                            onChanged: (value) {
                              addswitch = value;
                              switchChange();
                            },
                          ),
                        ),
                        Text('뺄셈',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        Switch(
                          value: subswitch,
                          activeColor: Colors.amberAccent,
                          activeTrackColor: const Color.fromARGB(255, 255, 255, 255),
                          onChanged: (value) {
                            subswitch = value;
                            switchChange();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('곱셈',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 19, 0),
                          child: Switch(
                            value: mulswitch,
                            activeColor: Colors.amberAccent,
                            activeTrackColor: const Color.fromARGB(255, 255, 255, 255),
                            onChanged: (value) {
                              mulswitch = value;
                              switchChange();
                            },
                          ),
                        ),
                        Text('나눗셈',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        Switch(
                          value: divswitch,
                          activeColor: Colors.amberAccent,
                          activeTrackColor: const Color.fromARGB(255, 255, 255, 255),
                          onChanged: (value) {
                            divswitch = value;
                            switchChange();
                          },
                        ),
                          ],
                        ),
                      ),
                TextField(
                  controller: addController,
                  decoration: InputDecoration(
                    labelText: '덧셈 결과',
                      filled: true,
                      fillColor: Colors.white
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: TextField(
                    controller: subController,
                    decoration: InputDecoration(
                      labelText: '뺄셈 결과',
                      filled: true,
                      fillColor: Colors.white
                    ),
                  ),
                ),
                TextField(
                  controller: mulController,
                  decoration: InputDecoration(
                    labelText: '곱셈 결과',
                      filled: true,
                      fillColor: Colors.white
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: TextField(
                    controller: divController,
                    decoration: InputDecoration(
                      labelText: '나눗셈 결과',
                      filled: true,
                      fillColor: Colors.white
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
      calcAction();
    }
  }
  
  calcAction(){
    int num1 = int.parse(num1Controller.text);
    int num2 = int.parse(num2Controller.text);
    mainadd = num1 + num2;
    mainsub = num1 - num2;
    mainmul = num1 * num2;
    addController.text = mainadd.toString();
    subController.text = mainsub.toString();
    mulController.text = mainmul.toString();

    if(num2 == 0){
      divController.text = "계산 할 수 없습니다.";
    }else{
      double maindiv = num1 / num2;
      divController.text = maindiv.toString();
    }
  }

  removeAll(){
    num1Controller.text = "";
    num2Controller.text = "";
    addController.text = "";
    subController.text = "";
    mulController.text = "";
    divController.text = "";
  }

  switchChange(){
    addController.text = addswitch == true? mainadd.toString() : "";
    subController.text = subswitch == true? mainsub.toString() : "";
    mulController.text = mulswitch == true? mainmul.toString() : "";
    divController.text = divswitch == true? maindiv.toString() : "";
    setState(() {});
  }

  errorSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('너 죽을래? 왜 시키는대로 안해'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

} // class