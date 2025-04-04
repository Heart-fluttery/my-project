main(){
  int num1 = 10;
  int num2 = 4;

  // 덧셈 계산을 Function으로 작업하여 출력
  // 출력 내용 : "덧셈 결과는 14 입니다."
  print(add(num1, num2));
  // 뺄셈 계산을 Function으로 작업하여 출력
  // 출력 내용 : "10 - 4 = 6"
  print(min(num1, num2));
  // 곱셈 계산을 Function으로 작업하여 출력
  // 출력 내용 : 40
  print(mul(num1, num2));
  // 나눗셈 계산을 Function으로 작업하여 출력
  // 출력 내용 : 2.5
  print(div(num1, num2));
} // main

String add(int num1, int num2){// 원하는 출력이 텍스트라서 앞에 String
// main 밖이라 num1, num2의 타입을 모르기에 지정, return에 출력물 작성
  return("덧셈 결과는 ${num1 + num2} 입니다.");
}
String min(int num1, int num2){
  return("$num1 - $num2 = ${num1-num2}");
}
int mul(int num1, int num2){
  return(num1 * num2);
}
double div(int num1, int num2){
  return(num1/num2);
}