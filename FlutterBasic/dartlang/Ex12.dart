// main에서 지정한 숫자를 가지고 구구단을 출력하는 클래스를 생성
// 단, 클래스와 데이터 전달 방법은 생성자를 이용한다.
// 출력시 곱해지는 수 중 홀수는 *로 표시한다.

// 결과
/*
  **** 4단 ****
  4 X 1 = 4
  4 X * = 8
  4 X 3 = 12
  4 X * = 16
  4 X 5 = 20
  4 X * = 24
  4 X 7 = 28
  4 X * = 32
  4 X 9 = 36
  **** 5단 ****
  5 X * = 5
  5 X 2 = 10
  5 X * = 15
  5 X 4 = 20
  5 X * = 25
  5 X 6 = 30
  5 X * = 35
  5 X 8 = 40
  5 X * = 45
*/

main(){
  Gugudan gugudanEven = Gugudan(4);
  gugudanEven.gugudanPrint();
  print("-----------------");
  Gugudan gugudanOdd = Gugudan(5);
  gugudanOdd.gugudanPrint();
}

class Gugudan{
  //property
  late int num1;
  //constructer
  Gugudan(int num1)
  :this.num1 = num1;
  //method
  gugudanPrint(){
    print("**** $num1단 ****");
    for(int i=1; i<10; i++){
      print("$num1 X ${num1%2 == i%2 ? "*" : i} = ${num1 * i}");
    }
  }

}