main(){// Ex07.dart에서 만든 함수 하나로 만들기 이럴 땐 타입을 지정안해서 dynamic으로 만들기
  int num1 = 10;
  int num2 = 4;
  List<int> list1 = [10, 4];

  // 1) if문으로 Function 구성하기
  // 덧셈 계산을 Function으로 작업하여 출력
  // 출력 내용 : "덧셈 결과는 14 입니다."
  print(calc(num1, num2, "add"));// 부를 때 쓰는 값은 파라미터
  // 뺄셈 계산을 Function으로 작업하여 출력
  // 출력 내용 : "10 - 4 = 6"
  print(calc(num1, num2, "sub"));
  // 곱셈 계산을 Function으로 작업하여 출력
  // 출력 내용 : 40
  print(calc(num1, num2, "mul"));
  // 나눗셈 계산을 Function으로 작업하여 출력
  // 출력 내용 : 2.5
  print(calc(num1, num2, "div"));

  // 2) Switch문으로 Function 구성하기
  print(switchcalc(num1, num2, "add"));
  print(switchcalc(num1, num2, "sub"));
  print(switchcalc(num1, num2, "mul"));
  print(switchcalc(num1, num2, "div"));

  // 3) Function에서 List를 제작한 후 if나 switch로 구성하기
  print(listcalc(list1, "add"));
  print(listcalc(list1, "sub"));
  print(listcalc(list1, "mul"));
  print(listcalc(list1, "div"));
  // 4) 삼항연산자를 사용하기

  // 5) 위의 것 중의 한 방식으로 BMI 변경하기 (function 사용)
} // main
// 파라미터와 아규먼트의 이름이 서로 달라도 상관없고 순서가 중요함
calc(int num1, int num2, String part){// 만들 때 쓰는 값은 Argument 아규먼트
  if(part == "add"){
  return("덧셈 결과는 ${num1 + num2} 입니다.");
  }else if(part == "sub"){
    return("$num1 - $num2 = ${num1-num2}");
  }else if(part == "mul"){
    return(num1*num2);
  }else if(part == "div"){
    return(num1/num2);
  }
  }

switchcalc(int num1, int num2, String part){
  switch (part) {
    case "add":
    return("덧셈 결과는 ${num1+num2} 입니다.");
    case "sub":
    return("$num1 - $num2 = ${num1-num2}");
    case "mul":
    return(num1*num2);
    default:
    return(num1/num2);
  }
}

listcalc(List<int> list1, String part){
  switch (part) {
    case "add":
    return("덧셈 결과는 ${list1[0]+list1[1]} 입니다.");
    case "sub":
    return("${list1[0]} - ${list1[1]} = ${list1[0]-list1[1]}");
    case "mul":
    return(list1[0]*list1[1]);
    case "div":
    return(list1[0]/list1[1]);
  }
}