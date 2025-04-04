main(){
  // Map : Key와 Value로 이루어진 Collection, 파이썬에서는 동일한 기능을 딕셔너리(사전)라고 함
  // 리스트 안에 딕셔너리가 있는걸 Json이라 함
  // 리스트 읽기 [{a:1, b:1}, {c:1, d:1}] a는 [0][a] d는 [1][d]
  Map fruits = {
    'apple':'사과',
    'grape':"포도",
    'watermelon':'수박'
  };
  // 원하는 정보 검색하기
  print(fruits['apple']);

  // 수정하기
  fruits['watermelon'] = '시원한 수박';
  print(fruits);

  // 데이터 추가하기
  fruits['banana'] = '바나나';
  print(fruits);

  // Map 새로운 구성
  Map carMakers = {};
  carMakers['aaa'] = 'AAA';
  carMakers.addAll({'hyundai':'현대자동차', 'kia':'기아자동차'});
  print(carMakers);

  // Map의 key만 따로 출력하기
  print(carMakers.keys.toString()); // 소괄호로 출력되는 Tuple : 읽기 전용
  print(carMakers.keys.toList()); // 중괄호인 List로 출력됨, 수정가능 
  print(carMakers.values.toList()); // Map을 리스트로 부르려면 keys, values로 두 번 불러야함

  // var carMakersNames = carMakers.keys.toString();// String인지 List인지 헷갈릴 땐 var로 선언

  // Generic 선언
  Map<String, int> fruitsPrice = { // Map은 <Key, Value>로 구성되기에 Generic 선언도 두개가 필요
    'apple' : 1000,
    'grape' : 2000,
    'watermelon' : 3000
  };
  print(fruitsPrice['apple']);
  int applePrice = fruitsPrice['apple']!;//int뒤에 물음표가 붙은 타입, 옵셔널 타입이라 함
  //최근 버전에만 있음, !는 강제 언랩핑
  print("사과의 가격은 $applePrice원 입니다.");
}