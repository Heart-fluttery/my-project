import 'calc01.dart';
import 'calc02.dart';
import 'calc03.dart';

main(){
  print("Property를 이용한 방법");
  Calc01 calc01 = Calc01(); // 앞에있는 Calc01은 class 불러온거 뒤에 있는 Calc01()생성자 불러온거
  // calc01은 변수, 객체(객체지향형 언어) int i = 10 과 같은 구조라 calc01은 변수이고 Calc01()을 받은 것
  calc01.num1 = 1;
  calc01.num2 = 2;
  print("덧셈 결과 : ${calc01.addition()}"); // addition은 앞에있는 calc01객체에 포함되어있어서 Method라고 함
  print("뺄셈 결과 : ${calc01.sub()}");
  print("곱셈 결과 : ${calc01.mul()}");
  print("나눗셈 결과 : ${calc01.div()}");
  print("");
  print("Method를 이용한 방법");
  Calc02 calc02 = Calc02();
  print("덧셈 결과 : ${calc02.addition(1, 2)}");
  print("뺄셈 결과 : ${calc02.sub(1, 2)}");
  print("곱셈 결과 : ${calc02.mul(1, 2)}");
  print("나눗셈 결과 : ${calc02.div(1, 2)}");
  print("");

  print("생성자를 이용한 방법");
  Calc03 calc03 = Calc03(1, 2);
  print("덧셈 결과 : ${calc03.addition()}");
  print("뺄셈 결과 : ${calc03.sub()}");
  print("곱셈 결과 : ${calc03.mul()}");
  print("나눗셈 결과 : ${calc03.div()}");

} // main

// // Property를 이용한 방법
// class Calc01{//파이썬은 소괄호가 있는데 다트는 없음, 언어마다 다름
//   // Property(Attribute, Field 다 똑같은 얘기 언어마다 다름)
//   int num1 = 0;
//   int num2 = 0;

//   // Constructor(생성자) // 안 쓰면 기본 생성자가 만들어짐

//   // Method // Function인데 Class안에 있어서 Method
//   int addition(){
//     return num1 + num2;
//   }
//   int sub(){
//     return num1 - num2;
//   }
//   int mul(){
//     return num1 * num2;
//   }
//   double div(){
//     return num1 / num2;
//   }

// } // Calc01