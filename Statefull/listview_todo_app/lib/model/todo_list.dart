class TodoList { // Method가 없는 클래스를 모델이라함
  // Property
  String imagePath;
  String workList;

  // Constructor
  TodoList(
    {
      required this.imagePath,
      required this.workList // required this. 값이 반드시 있어야 할 때 씀
    }
  );
}