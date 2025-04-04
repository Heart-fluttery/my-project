main(){
  // 변수 선언
  // 파이썬, R말고는 모두 변수의 타입을 정해줘야함
  // var 변수 선언 : 데이터에 의한 추론형 변수 선언
  var name = "유비"; // 이 때 처음으로 name이라는 변수명이 heap 메모리에 등록됨
  name = "장비"; // 변수 선언이 이미 끝났기 때문에 var 없이 써야함
  print(name);

  var height = 100;
  print (height); //print로 화면에 출력되는 100은 숫자가 아닌 문자열
  //화면에 출력된 100을 계산하기 위해서는 정수로 변환해야함, 화면에 문자열로 표시되는 이유는 암호화 때문

  //heigt = 'abc'; //이미 정수로 인식돼서 문자열이 들어갈 수 없음
  var weight = 45.8;
  print(weight);

  //var gender = true; // 1이 true, 0이 false
  // bool < int < double < string 메모리 차지 순서
  //gender = false;

  // 내 친구의 이름은 장비 입니다.
  print("내 친구의 이름은 " + name + "입니다.");

  // var는 잘 안씀, 데이터를 받을 때 어떤 데이터가 오는지 모를 때만 사용
}