import 'dart:convert';

main(){
  // List와 Map이 같이 있는게 JSON 타입은 보통 var로 적음
  // ''' ''' 안에는 모두 String 지금은 List안에 Map이 2개있는 모습
  // List 주소는 무조건 , 콤마 기준 
  var jsonString = '''
  [
    {
      "score":40
    },
    {
      "score":80
    }
  ]
''';

  var scores = jsonDecode(jsonString); // Decode 압축해제, Encode 압축
  print(jsonString);
  var firstScore = scores[0];
  print(firstScore);
  print(firstScore['score']); // 순서를 보여주기 위해 작성한 것 

  print(scores[0]['score']); // 보통 이렇게 사용함
}