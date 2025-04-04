// List의 최대값과 최대값 위치 구하기

// 결과
// 숫자들 중 최대값은 15이고 5번째 값 입니다.

main(){
  // int num1 = 0;
  // int num2 = 0;
  // List<int> num = [11,12,13,14,15];
  // for (int i=1; i<num.length; i++) {
  //   if(num3 > num3){
  //     num3 = num1;
  //   }
  // } 
  // print("숫자들 중 최대값은 $num1이고 $num2번째 값입니다.");

  List<int> num = [11,13,11,15,12];
  int maxValue = num[0];
  int loopCount = 0;
  int maxIndex = 0;

  for(int i in num){
    loopCount++;
    if(i > maxValue){
      maxValue = i;
      maxIndex = loopCount;
    }
  }
  print("$maxValue --> $maxIndex");

  // List<int> num = [13,11,15,12,10];
  // int minValue = num[0];
  // int loopCount = 0;
  // int minIndex = 0;

  // for (int i in num) {
  //   loopCount++;
  //   if (i < minValue) {
  //     minValue = i;
  //     minIndex = loopCount;
  //   }
  // }
  // print('최소값은 $minValue이고 $minIndex번째 입니다.');
}