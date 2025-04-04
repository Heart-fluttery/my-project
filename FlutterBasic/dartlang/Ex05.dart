// List를 이용하여 5보다 작은 숫자만 List에 넣기

main(){
  List<int> nums = [1,1,2,3,5,8,13,21,34,66,89];
  List<int> result = [];
  for (int num in nums) {
    if(num<10){
      result.add(num);
    }
  }
  print(result);
  
  // List Comprehension(최신 언어에 있는 기능)
  print([for(int num in nums) if (num<5) num]);
}
