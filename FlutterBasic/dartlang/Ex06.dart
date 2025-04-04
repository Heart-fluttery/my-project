// BMI 계산하기
// 신장이 170cm이고 몸무게가 70Kg인 경우의 BMI 계산하기

import 'dart:math';

main(){
  double height = 170;
  double weight = 70;
  double bmi = 0;
  String result = "";
  bmi = weight/ pow((height/100), 2) ;
  if(bmi>=30){
    result = "고도비만";
  }
  if(bmi<=29.9){
    result = "비만";
  }
  if(bmi<=24.9){
    result = "과체중";
  }
  if(bmi<=22.9){
    result = "정상체중";
  }
  if(bmi<=18.4){
    result = "저체중";
  }
  print("당신은 $result입니다.");
}