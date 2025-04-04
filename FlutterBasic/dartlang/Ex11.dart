// main에서 지정한 숫자를 가지고 구구단을 출력하는 클래스를 생성
// 단, 클래스와 데이터 전달 방법은 생성자를 이용한다.
// 출력시 곱해지는 수 중 홀수는 *로 표시한다.

// 결과
/*
  **** 4단 ****
  4 X * = 4
  4 X 2 = 8
  4 X * = 12
  4 X 4 = 16
  4 X * = 20
  4 X 6 = 24
  4 X * = 28
  4 X 8 = 32
  4 X * = 36
*/

main(){
  Gugudan gugudan = Gugudan(4);
  gugudan.gugudanPrint();
}

class Gugudan{
  //property
  late int num1;
  //constructer //생성자가 생성하고 위 property로 넘겨서 method가 생성할 수 있게 해줌
  Gugudan(int num1)
  :this.num1 = num1;
  //method
  gugudanPrint(){
      print("**** $num1단 ****");
    for(int i=1; i<=9; i++){
      // if(i%2==1){
      //   print("$num1 X * = ${num1*i}");
      // }else{
      //   print("$num1 X $i = ${num1*i}");
      // }
      print("$num1");
    }
  }
}