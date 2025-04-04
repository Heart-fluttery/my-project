import 'package:flutter/material.dart';
/* 3월27일 이학현 작업
간단한 계산기 다시 만들기
*/
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController num1Controller; // 숫자 1 입력 (키보드는 숫자)
  late TextEditingController num2Controller; // 숫자 2 입력 (키보드는 숫자)
  late TextEditingController addController; // 덧셈 결과 (읽기만)
  late TextEditingController subController; // 뺄셈 결과 (읽기만)
  late TextEditingController mulController; // 곱셈 결과 (읽기만)
  late TextEditingController divController; // 나눗셈 결과 (읽기만)

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    addController = TextEditingController();
    subController = TextEditingController();
    mulController = TextEditingController();
    divController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('간단한 계산기'),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                TextField( // 텍스트 필드오면 컨트롤러 넣어주기
                  controller: num1Controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '첫번째 숫자를 입력하세요'
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: num2Controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '두번째 숫자를 입력하세요'
                  ),
                  keyboardType: TextInputType.number,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        calcAction();
                      },
                      child: Text('계산하기'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        removeAll();
                      },
                      child: Text('지우기'),
                    ),
                  ],
                ),
                TextField(
                  controller: addController,
                  decoration: InputDecoration(
                    labelText: '덧셈결과'
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: subController,
                  decoration: InputDecoration(
                    labelText: '뺄셈결과'
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: mulController,
                  decoration: InputDecoration(
                    labelText: '곱셈결과'
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: divController,
                  decoration: InputDecoration(
                    labelText: '나눗셈결과'
                  ),
                  readOnly: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } // build

  // ---- Functions ----
  calcAction(){
    if(num1Controller.text.trim().isEmpty || num2Controller.text.trim().isEmpty){
      // errorSnackBar();
    }else{
      calcResult();
    }
  }
  // 관련 함수는 바로 밑에 적는게 좋음
  calcResult(){
    int num1 = int.parse(num1Controller.text);
    int num2 = int.parse(num2Controller.text);

    int addResult = num1 + num2;
    int subResult = num1 - num2;
    int mulResult = num1 * num2;

    addController.text = addResult.toString();
    subController.text = subResult.toString();
    mulController.text = mulResult.toString();

    // 나눗셈의 경우 분모가 0인 경우에는 계산 불가
    if(num2 == 0){
      divController.text = 'Impossible';
    }else{
      double divResult = num1 / num2;
      divController.text = divResult.toString();
    }
  }

  removeAll(){
    //
  }
} // class