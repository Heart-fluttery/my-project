// Property를 이용한 방법
class Calc03{//파이썬은 소괄호가 있는데 다트는 없음, 언어마다 다름
  // Property(Attribute, Field 다 똑같은 얘기 언어마다 다름)
  int _num1 = 0; // _ =>Private 함수에도 사용가능
  int _num2 = 0;

  // Constructor(생성자) // 안 쓰면 기본 생성자가 만들어짐
  Calc03(int num1, int num2)
  : _num1 = num1,
    _num2 = num2;

  // Method // Function인데 Class안에 있어서 Method
  int addition(){
    return _num1 + _num2;
  }
  int sub(){
    return _num1 - _num2;
  }
  int mul(){
    return _num1 * _num2;
  }
  double div(){
    return _num1 / _num2;
  }

} // Calc03