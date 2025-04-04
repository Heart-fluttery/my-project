main(){
  // 문자열
  String str1 = "유비"; //객체형
  String str2 = "장비"; 

 // 유비 : 장비
  print(str1 + ":" + str2);

  int intNum1 = 10;
  int intNum2 = 20;
  // 10 + 20 = 30
  //print(intNum1 + "+" ~~ + intNum1+intNum2) 같이 쓰지 않음, 에러남

  // 문자열 보간법(String Interpolation)
  // 유비 : 장비
  print("$str1 : $str2"); // $넣어서 문자열에 변수를 쓸 수 있음, 파이썬은 f스트링 사용
  String result = "$str1 : $str2"; // 화면에 문자열 출력해주는 위젯
  print(result);

  //print("$intNum1 + $intNum2 = $intNum1 + $intNum2"); //10 + 20 = 10 + 20
  print("$intNum1 + $intNum2 = ${intNum1 + intNum2}"); //계산이 필요할 땐 $중괄호로 묶음
}