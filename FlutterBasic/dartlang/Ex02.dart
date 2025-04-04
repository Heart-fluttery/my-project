// 입력한 한 자릿수 정수의 합 구하기
// 입력숫자 : 123456
// 결과
// Sum of 12345678 = 36

import 'dart:math';

main(){
  // int inputValue = 12345678;
  // int sum1 = 0;
  // int number = 0;
  // while (number < 9) {
  //   sum1 = sum1 + inputValue ~/ pow(10, number) % 10;
  //   number++;
  // }
  // print(sum1);
  int inputValue = 12345678;
  int remainder = 0;
  int sum = 0;
  while(inputValue != 0){
    remainder = inputValue % 10;
    sum += remainder;
    inputValue = inputValue ~/ 10;
  }
  print(sum);
}