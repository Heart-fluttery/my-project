import 'package:todolist_my_test_app/model/todo_frame.dart';

class TodoData {
  // TodoList 데이터 보관 클래스
  static List<Todolist> todolist = [];

  static List<Todolist> get activeTodo =>
  todolist.where((e) => !e.trashmark).toList();

  static List<Todolist> get favoriteTodo =>
  todolist.where((e) => e.bookmark && !e.trashmark).toList();

  static List<Todolist> get trashedTodo =>
  todolist.where((e) => e.trashmark).toList();
}