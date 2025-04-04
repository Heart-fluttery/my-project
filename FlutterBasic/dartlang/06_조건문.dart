main(){
  // 조건문 (Conditional Statement)
  int num1 = 10; //5라고 가정하고 설정, 사용자에 의해 변할 수 있음
  String result = "";

  if(num1 > 10){
    result = "10보다 큰";
  }
  else if(num1 < 10){
    result = "10보다 작은";
  }
  else{
    result = "10과 같은";
  }
  
  print("입력된 숫자 $num1은(는) $result 수 입니다.");

  //------------------------------------------//
  // Exercise
  // 변수에 있는 숫자 값을 비교해서
  // 숫자가 5의 배수이면 '입력된 숫자 __는 5의 배수 입니다'
  // 숫자가 5의 배수가 아니면 '입력된 숫자 __는 5의 배수가 아니며 나머지 값은 __ 입니다.'

  int num2 = 10;

  if(num2 % 5 > 0){
    print('입력된 숫자 $num2는 5의 배수가 아니며 나머지 값은 ${num2 % 5}입니다.');
  }else{
    print('입력된 숫자 $num2는 5의 배수 입니다.');
  }

  // Swich if보다 빠름, Dart에서는 잘 안쓰지만 Swift에서는 많이 씀
  switch(num2 % 5){
    case 0:
    print('입력된 숫자 $num2는 5의 배수 입니다.');
    default://default가 else
    print('입력된 숫자 $num2는 5의 배수가 아니며 나머지 값은 ${num2 % 5}입니다.');
  }

  // Exercise
  // num2가 2의 배수이면 '2의 배수입니다.'
  // num2가 3의 배수이면 '3의 배수입니다.'
  // num2가 5의 배수이면 '5의 배수입니다.'

  num2 = 120;
  
  // if(num2 % 30 == 0){
  //   result = '2의 배수입니다.\n3의 배수입니다.\n5의 배수입니다.';
  // }else if(num2 % 15 == 0){
  //   result = '3의 배수입니다.\n5의 배수입니다.';
  // }else if(num2 % 6 == 0){
  //   result = '2의 배수입니다.\n3의 배수입니다.';
  // }else if(num2 % 3 == 0){
  //   result = '3의 배수입니다.';
  // }else if(num2 % 2 == 0){
  //   result = '2의 배수입니다.';
  // }else{
  //   result = '입력한 숫자 $num2는 2, 3, 5의 배수가 아닙니다.';
  // }

  print(result);

  int score = 100;
  // Exercise
  // 점수를 입력 받아 학점으로 표시하기
  // 90점 이상이면 : '입력하신 점수 __는 A학점 입니다.'
  // 80점 이상이면 : '입력하신 점수 __는 B학점 입니다.'
  // 70점 이상이면 : '입력하신 점수 __는 C학점 입니다.'
  // 60점 이상이면 : '입력하신 점수 __는 D학점 입니다.'
  // 60점 미만이면 : '입력하신 점수 __는 F학점 입니다.'

  String grade ="";

  if(score > 100 || score < 0){
    print('Data를 확인하세요');
  }else{
  if(score >= 90){
    grade = 'A';
  }else if(score >= 80){
    grade = 'B';
  }else if(score >= 70){
    grade = 'C';
  }else if(score >= 60){
    grade = 'D';
  }else{
    grade = 'F';
  }
  print('입력하신 점수 $score는 $grade학점 입니다.');
  }

  // Switch문으로 해보기

  if(score > 100 || score <0){
    print('Data를 확인하세요');
  }else{
  switch(score ~/ 10){
    case 10: 
    case 9: 
    grade = 'A';
    case 8:
    grade = 'B';
    case 7:
    grade = 'C';
    case 6:
    grade = 'D';
    default :
    grade = 'F';
  }
  print('입력하신 점수 $score는 $grade학점 입니다.');
  }

  // 삼항 연산자 중요, 디자인에는 if를 못 쓰는데 얘는 쓸 수 있음
  // bool isPublic = true;
  // var vis = isPublic ? "True" : "False"; // True인지 묻는 것, 값이 true로 고정되어 있어서
  // False가 절대 쓰일 일이 없어서 dead code가 됨
  // print(vis);
  // 데이터를 체크할 때 if가 필요해서 디자인에서 삼항 연산자가 들어감
  // 데이터가 다 들어왔을 땐 페이지를, 안 들어왔을 땐 로딩
}