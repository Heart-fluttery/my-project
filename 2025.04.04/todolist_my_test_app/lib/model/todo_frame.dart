class Todolist {
  // Property
  bool bookmark; // 즐겨찾기
  bool comple; // 완료항목
  String todo; // 할일 내용
  String icon; // 아이콘

  // Constructor
  Todolist(
    {
      required this.bookmark,
      required this.comple,
      required this.todo,
      required this.icon,
    }
  );
}