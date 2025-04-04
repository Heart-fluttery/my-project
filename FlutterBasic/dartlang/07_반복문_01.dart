main(){ // 메인에서 쓰는 변수는 전역변수, 메인 안에서 고정되기 때문에 같은 이름을 못 씀
  // for문
  // 1부터 10까지 출력해보기
  for(int i=1;i<=10;i++){// for(from, to, step)
  print(i);
  }

  // 1부터 10까지 합 구하기
  int sum = 0;
  int startNum = 1;
  int endNum = 100; // 책에는 보통 for문에 상수를 넣는데 변수를 넣는게 좋음
  for(int i=startNum;i<=endNum;i++){ // 함수 내에서 쓰는 변수는 지역 변수, 함수 내에서만 기억하기 때문에 함수 간에 같은 변수 이름 사용 가능
  sum += i; //sum = sum + i
  }
  print('$startNum부터 $endNum까지의 합계는 $sum 입니다.');

  // Exercise
  // 1부터 10까지의 수 중 짝수의 합과 홀수의 합 구하기(단, for문은 1개만 사용, 수의 범위는 변경 가능)
  // 출력 예시 : 1부터 10까지의 수 중 짝수의 합은 ___이고 홀수의 합은 ___입니다.
  int sum1 = 0;
  int sum2 = 0;
  int startNum1 = 1;
  int endNum1 = 10;
  // for(int i=startNum1;i<=endNum1;i+=2){
  //   sum1 = sum1 + i+1;
  //   sum2 += i;
  // }
  for(int i=startNum1;i<=endNum1;i++){
    if(i % 2 == 0){
      sum1 += i;
    }else{
      sum2 += i;
    }
  }
  print('$startNum1부터 $endNum1까지의 수 중 짝수의 합은 $sum1이고 홀수의 합은 $sum2입니다.');

  // List를 반복문에 사용하기
  List<int> numList = [1,3,5,7,9];
  int sumList = 0;
  for(int i=0; i < numList.length; i++){// 자바에서 쓰는 방식
    sumList += numList[i];
  }
  print(sumList);

  sumList = 0;
  for(int num in numList){// 요즘은 for in을 많이 씀
    sumList += num;
  }
  print(sumList);

  // while
  int sumNum = 0;
  int number = 1;
  while (number <= 10){
    sumNum += number;
    number++;
  }
  print(sumNum);

  while(number <= 100){
    if(number > 10){
      break;
    }
    number++;
  }

  for(int i=1; i<=100; i++){
    if(i==5){
      // break; 많은 수 중 한 숫자를 찾을 때 사용
      continue; // 밑에 소스 코드로 안 가고 위로 다시 올라감 그래서 5일 때 6이 출력됨
    }
    print(i);
  }
}