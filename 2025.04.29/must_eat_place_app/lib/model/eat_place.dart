/*
2025.04.29 이학현
EatPlace 모델 타입
*/
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

class EatPlace {
  // Property
  final int? id; // Primary Key
  late double latitude; // 위도
  late double longitude; // 경도
  late String name; // 가게 이름
  late String tel; // 전화 번호
  late int score; // 평점 5점만점 별 아이콘으로 만들 예정
  late String review; // 손님 평가
  late Uint8List image; // 가게 혹은 음식 이미지
  late int favorite; // 즐겨찾기

  // Constructor
  EatPlace(
    {
      this.id,
      required this.latitude,
      required this.longitude,
      required this.name,
      required this.tel,
      required this.score,
      required this.review,
      required this.image,
      required this.favorite
    }
  );

  // Factory, Map을 Todolist 객체로 변환하는 생성자
  EatPlace.fromMap(Map<String, dynamic> res)
  : id = res['id'],
    latitude = res['latitude'],
    longitude = res['longitude'],
    name = res['name'],
    tel = res['tel'],
    score = res['score'],
    review = res['review'],
    image = res['image'],
    favorite = res['favorite'];
}