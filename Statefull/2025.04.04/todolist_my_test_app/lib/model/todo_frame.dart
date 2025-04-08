/*
  작성일 2025.04.04 작성자 이학현
  todolist 모델 클래스
*/
import 'package:flutter/material.dart';

class Todolist {
  // TodoList 모델클래스
  // Property
  bool comple; // 완료 여부
  IconData? icon; // 아이콘
  String todo; // 할일 내용
  bool trashmark; // 휴지통 여부
  bool bookmark; // 즐겨찾기 여부
  DateTime selectedTime; // 만든 시간
  
  // Constructor
  Todolist(
    {
      this.comple = false,
      this.icon,
      required this.todo,
      this.trashmark = false,
      this.bookmark = false,
      required this.selectedTime,
    }
  );
}