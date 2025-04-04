main(){
  // 변수 타입 선언자
  // 정수 선언자
  int intNum1 = 30;
  print(intNum1);

  int intNum2 = 20;
  print (intNum2);

  // 사칙연산
  print(" ** 정수 사칙 연산 **");
  print(intNum1 + intNum2); // 덧셈 계산
  print(intNum1 - intNum2); // 뺄셈 계산
  print(intNum1 * intNum2); // 곱셈 계산
  print(intNum1 / intNum2); // 나눗셈 계산, 정수나누기 정수라 일부 언어에서는 정수 1이 출력됨
  print(intNum1 % intNum2); // 나머지 remainder, 보통 r로 표현
  print(intNum1 ~/ intNum2); // 몫 quotient, 보통 q로 표현
  
  // 실수
  double doubleNum1 = 1.5;
  double doubleNum2 = 0.2;

  print(doubleNum1 + doubleNum2);
  print(doubleNum1 - doubleNum2);
  print(doubleNum1 * doubleNum2);
  print(doubleNum1 / doubleNum2);
  print(doubleNum1 % doubleNum2); //값이 나오긴 하지만 근접한 수로 나오기에 안씀
  print(doubleNum1 ~/ doubleNum2); //실수는 원래 몫과 나머지가 없음

}