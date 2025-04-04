import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Property
  var value = Get.arguments ?? "__"; // null이 들어오면 __가 들어옴
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Single Arguments: $value',
            ),
            Text(
              'Multiple Arguments #1 : ${value[0]}\n'
              'Multiple Arguments #2 : ${value[1]}'
            ),
            ElevatedButton(
              onPressed: () => Get.back(result: "Good"),
              // 여기서 Get.back을 할 때 데이터를 넘겨서 home에서 await를 해줘야함
              child: Text('Reply'),
            ),
          ],
        ),
      ),
    );
  }
}