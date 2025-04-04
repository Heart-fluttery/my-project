import 'package:flutter/material.dart';
/* 
2025-03-27 이학현
이미지가 변하는 간단한 bmi 계산기
*/
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1Controller; // 신장 입력 (숫자만)
  late TextEditingController num2Controller; // 체중 입력 (숫자만)
  late double bmiResult; // bmi 값
  late String imageName; // bmi 이미지
  late String bmiMessage; // bmi 메세지
  late String bmiPart; // bmi 단계
  

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    bmiResult = 0;
    imageName = "bmi.png";
    bmiMessage = "";
    bmiPart = "";
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('BMI 계산기'),
          backgroundColor: Colors.blue,
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '신장을 입력하세요 (단위: cm)',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: TextField(
                    controller: num2Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '몸무게를 입력하세요 (단위: kg)',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    bmiCalc();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors. blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  child: Text('BMI 계산',
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(bmiMessage,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 18
                    ),),
                  ),
                  Image.asset('images/$imageName'),
              ],
            ),
          ),
        ),
      ),
    );
  } // build

  // ---- Functions ----
  //bmi = 체중 / 신장**
  bmiCalc(){
    if(num1Controller.text.trim().isEmpty || num2Controller.text.trim().isEmpty){
      errorSnackBar();
    }else{
      double cm = double.parse(num1Controller.text);
      double kg = double.parse(num2Controller.text);
      bmiResult = kg / ((cm/100)*(cm/100)); 
      bmiPartChek();
    }
    setState(() {});
  }

  bmiPartChek(){
    if (bmiResult >= 30) {
      imageName = 'obese.png';
      bmiPart = '고도비만';
    }else if(bmiResult >= 25){
      imageName = 'overweight.png';
      bmiPart = '비만';
    }else if(bmiResult >= 23){
      imageName = 'risk.png';
      bmiPart = '과체중';
    }else if(bmiResult >= 18.5){
      imageName = 'normal.png';
      bmiPart = '정상체중';
    }else if(bmiResult >= 0){
      imageName = 'underweight.png';
      bmiPart = '저체중';
    }
    bmiMessage = '귀하의 bmi 지수는 ${bmiResult.toStringAsFixed(1)}이고 $bmiPart 입니다.';
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