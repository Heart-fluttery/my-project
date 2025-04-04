// 클래스 간에 데이터를 공유하기 위해 만든 모델
class Message { // 생성자가 있으면 데이터가 틀어지기 때문에 Property만 있음
  // Property
  static String workList = "";
  static String imagePath = "";
  static bool action = false;
}