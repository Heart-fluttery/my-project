import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late String imageName;
  late String bmiText;
  late double bmiResult;
  late int selectedHeight;
  late int selectedWeight;

  @override
  void initState() {
    super.initState();
    imageName = 'images/risk.png';
    bmiText = "과체중";
    bmiResult = 23.4;
    selectedHeight = 160;
    selectedWeight = 60;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI 계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('신장'),
                      SizedBox(
                        width: 100,
                        height: 200,
                        child: CupertinoPicker(
                          itemExtent: 50,
                          scrollController: FixedExtentScrollController(initialItem: 60), 
                          onSelectedItemChanged: (value) {
                            selectedHeight = value+100;
                            bmiCalc(); 
                            setState(() {});
                          }, 
                          children: List.generate(
                            101, 
                            (index) => Center(
                              child: Text('${index+100}'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('몸무게'),
                      SizedBox(
                        width: 100,
                        height: 200,
                        child: CupertinoPicker(
                          itemExtent: 50,
                          scrollController: FixedExtentScrollController(initialItem: 30), 
                          onSelectedItemChanged: (value) {
                            selectedWeight = value+30;
                            bmiCalc();
                            setState(() {});
                          }, 
                          children: List.generate(
                            171, 
                            (index) => Center(
                              child: Text('${index+30}'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '귀하의 bmi지수는 ${bmiResult.toString().substring(0,4)} 이고 $bmiText 입니다.',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
              ),
              Image.asset(imageName,width: 300,)
            ],
          ),
        ),
      ),
    );
  } // build

  // ---- Functions ----
  bmiCalc(){
    bmiResult = selectedWeight / ((selectedHeight/100)*(selectedHeight/100));
    if (bmiResult >= 30) {
      imageName = 'images/obese.png';
      bmiText = '고도비만';
    }else if(bmiResult >= 25){
      imageName = 'images/overweight.png';
      bmiText = '비만';
    }else if(bmiResult >= 23){
      imageName = 'images/risk.png';
      bmiText = '과체중';
    }else if(bmiResult >= 18.5){
      imageName = 'images/normal.png';
      bmiText = '정상체중';
    }else if(bmiResult >= 0){
      imageName = 'images/underweight.png';
      bmiText = '저체중';
    }
  }
} // class