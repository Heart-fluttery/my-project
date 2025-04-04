main(){
  //  var와 dynamic 타입의 차이, 파이썬은 다 dynamic
  var name = "유비";
  name = "관우";
  // name = 1; //에러

  dynamic name1 = '장비';
  name1 = "조자룡";
  name1 = 10;
  
  int num1 = 100;
  print(name1 + num1);//Dart에서는 dynamic과 var을 섞어서 계산할 수 있는데
  //안 쓰는 게 좋음 헷갈리기도 하고 메모리를 많이 차지함
}