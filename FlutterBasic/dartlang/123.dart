main(){
List<int> score = [34, 32, 55, 57, 59, 53, 90, 88, 88, 12, 100, 50, 60, 70, 10, 100];
var histo = List<int>.filled(10, 0);// 0이 10개인 리스트
for(int i=0; i<score.length; i++){
  histo[score[i] ~/ 10]++; // 34부터 예시를 들면 histo[score[0](=34) ~/ 10(=3)]
  // > histo[3]++;가 돼서 histo의 3+1번째 자리에 1이 카운트됨
}// 100까지 출력하게 만들어보기
  int mm = 10;
for(int i=(score.length - 1); i>=0; i--){
  String scoreLength = "";
  for(int j = 1; j <=histo[i]; j++){
    scoreLength += "#";
  }
  print("${10*mm} : $scoreLength");
  if(mm>=0){
    mm--;
  }
  }
}