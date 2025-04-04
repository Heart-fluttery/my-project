import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late int countNum; // 클릭수

  @override // initState 불러와서 초기값 설정
  void initState() {
    super.initState();
    countNum = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Count Up')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('현재 클릭수는 $countNum입니다.'),
            ),
            FloatingActionButton(
              onPressed: () {
                addCount();
              },
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     addCount();
      //   },
      //   backgroundColor: Colors.redAccent,
      //   foregroundColor: Colors.white,
      //   child: Icon(Icons.add),
      // ),
      floatingActionButton: ElevatedButton(
        onPressed: () => addCount(),
        child: Text('Add'),
      ),
    );
  } // build

  // ---- Functions ----
  addCount() {
    countNum++;
    setState(() {});
  }
} // class
