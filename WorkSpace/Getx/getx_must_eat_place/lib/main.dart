import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_must_eat_place/view/query_place.dart';
import 'package:getx_must_eat_place/vm/vm_handler_temp.dart';

void main() {
  Get.put(VmHandlerTemp()); //하나만 써도 상관없음
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const QueryPlace(),
    );
  }
}

