/*
작성일 2025.04.07 작성자 이학현
전역으로 관리할 todolist 생성, 메서드를 통해 리스트를 필터링, 삭제
*/
import 'package:todolist_my_test_app/model/todo_frame.dart';

class TodoData {
  // TodoList 데이터 보관 클래스
  static List<Todolist> todolist = [];

  // 할 일 목록 반환 메서드
  static List<Todolist> get activeTodo =>
  todolist.where((e) => !e.trashmark).toList();

  // 중요한 일 목록 반환 메서드
  static List<Todolist> get favoriteTodo =>
  todolist.where((e) => e.bookmark && !e.trashmark).toList();

  // 휴지통 목록 반환 메서드
  static List<Todolist> get trashedTodo =>
  todolist.where((e) => e.trashmark).toList();

  // 선택된 휴지통 목록 영구삭제 메서드
  static void deleteForever(Todolist item){
  todolist.remove(item);
  }
}