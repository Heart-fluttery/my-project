/*main(){ // 동기처리방식
  checkVersion();
  print('end Process');
}

checkVersion(){
  var version = lookupVersion();
  print(version);
}

int lookupVersion(){
  return 12; // 출력 : 12 end Process
}*/


main(){ // 비동기처리방식
  checkVersion();
  print('end Process');
}

checkVersion()async{// print가 먼저 출력되면 안 되기 때문에 await를 넣어줌
  var version = await lookupVersion(); // lookupVersion이 끝날 때까지 기다림
  print(version);
}

int lookupVersion(){
  return 12; // 출력 : end Process 12
}