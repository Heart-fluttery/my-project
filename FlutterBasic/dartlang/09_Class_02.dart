main(){
  int n1 = 10;
  int n2 = 20;

Sub sub = Sub(n1, n2);
print(sub.addition()); // 상속받아서 addition이 있음
print(sub.sub()); // 원래 본인 안에 있던 함수

} // main

class Add{
  // Property
  late int num1; // late => 처음에 안 만들어지고 누가 생성이 되면 그 후에 만들어짐 int?와 비슷한 기능인데 late가 좋음
  late int num2; // 데이터를 안 주고 시작할 때 late를 씀, 데이터를 받고 시작하기 때문

  // Constructor
  Add(int num1, int num2)
  : this.num1 = num1, // 똑같은 이름을 써서 this로 구분 this.num1이 late int num1
    this.num2 = num2;
  // Method
  int addition(){
    return num1 + num2;
  }

} // Add

class Sub extends Add{ // Add를 Sub에 상속
  Sub(super.num1, super.num2); // super.num1 => 부모 클래스의 변수를 뜻함
  int sub(){
    return num1 - num2;
  }

}