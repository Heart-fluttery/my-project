main(){
  // 연산자
  // 자동 증감 연산자
  int num = 0;
  num = num + 1;
  num++; //위랑 똑같은 코드
  print(num);

  num--; // num = num - 1
  print(num);

  num += 2; // num = num + 2
  print(num);

  // Optional : Null Safety // 코딩할 때 빨간 줄 나오게? 파이썬에서는 None, 스위프트에서는 NaN
  // int num1 = 10;
  // int num2 = null;
  int? num2 = null;// ? <- Optional을 넣어서 빈 값이 오더라도 오류를 컴파일 단계에서 출력함
  print(num2);

  num2 ??= 8;// num2가 null이면 기본값을 8로 함
  print(num2);

  int? num3;
  print(num3 ??= 5);

  // int num4;
  // print(num4++); //null 값을 수용하지 않았기 때문에 오류남

  // 조건 연산자
  int num5 = 10;
  int num6 = 5;

  print(num5 < num6);
  print(num5 > num6);
  print(num5 <= num6);
  print(num5 >= num6); // =>는 팻 애로우라서 안됨
  print(num5 == num6); // 같은지
  print(num5 != num6); // 다른지

  // 논리 연산자
  bool result = 12 > 10 && 1 > 0; // &&는 and 연산자, 파이썬은 and로 쓰는 등 언어마다 다름
  print(result);

  bool result2 = 10 > 5 || 1 > 2; // ||는 or 연산자, 파이썬은 or로 쓰는 등 언어마다 다름
  print(result2);
}