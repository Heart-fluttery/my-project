/*
  작성일 2025.04.04 작성자 이학현
  아이디 모델 클래스
*/
class Userframe {
  // User 모델 클래스
  // Property
  String userid;
  String userpw;

  // Constructor
  Userframe(
    {
      required this.userid,
      required this.userpw,
    }
  );
}