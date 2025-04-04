import 'package:flutter/material.dart';
// Dart의 List View는 메모리 재활용을 자동으로 해 화면이 넘어가는 부분은 메모리를 날림
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  // late List<String> todoList;
  late List<int> todoList;

  @override
  void initState() {
    super.initState();
    todoList = []; // 리스트 초기화
    addData(); // todoList에 데이터추가하는 함수
  }

  addData(){
    // todoList.add('James');
    // todoList.add('Cathy');
    // todoList.add('Martin');
    // todoList.add('유비');
    // todoList.add('관우');
    // todoList.add('장비');
    // todoList.add('피카츄');
    // todoList.add('라이츄');
    // todoList.add('꼬부기');
    // todoList.add('조조');
    // todoList.add('여포');
    // todoList.add('동탁');

    for (var i = 1; i <= 1000; i++) {
      todoList.add(i);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main View'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length, // 리스트 개수만큼 Builder로 Card만들기
          itemBuilder: (context, index) {
            return SizedBox( // Card에서 이미 color를 쓸 수 있기 때문에 SizedBox로 크기 조정
              height: 100,
              child: Card(
                color: Colors.amberAccent,
                child: Center(
                  child: Text(
                    todoList[index].toString(), // 반복문이 없어도 0부터 Count만큼 반복함
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}