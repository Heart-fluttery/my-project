// Property를 이용한 방법
class Calc01{//파이썬은 소괄호가 있는데 다트는 없음, 언어마다 다름
  // Property(Attribute, Field 다 똑같은 얘기 언어마다 다름)
  int num1 = 0;
  int num2 = 0;

  // Constructor(생성자) // 안 쓰면 기본 생성자가 만들어짐

  // Method // Function인데 Class안에 있어서 Method
  int addition(){
    return num1 + num2;
  }
  int sub(){
    return num1 - num2;
  }
  int mul(){
    return num1 * num2;
  }
  double div(){
    return num1 / num2;
  }

} // Calc01