/*
  작성일 2025.04.09 작성자 이학현
  mainscreen의 bottomsheet에서 선택된 날짜를 띄울 수가 없어서 새로 추가함
*/
import 'package:get/get.dart';

class Datecontroller extends GetxController {
  var selectDateText = "".obs;

  void resetDate() {
    selectDateText.value = "";
  }

  void setDate(String date) {
    selectDateText.value = date;
  }
}