main(){
  //function > Class없이 만든거, mathod > Class에 있는 function
  List<int> list1 = [1,3,5,7,9];
  List<int> list2 = [10,30,50,70,90];//입력

  // 동일한 기능의 코드인데 중복되어 코딩함. 이 때 쓰는게 function
  // addList(list1);
  // addList(list2); //이렇게 쓰는 경우는 거의 없음
  int sum1 = addList(list1);
  int sum2 = addList(list2);//처리

  print("리스트의 합계는 $sum1입니다.");
  print("리스트의 합계는 $sum2입니다.");//출력

} // main

int addList(List<int> list11){
  int sum = 0;
  for(int li in list11){
    sum+=li;
  }
  return(sum);// print쓰면 안됨
}