import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/view/detail_list.dart';
import 'package:listview_todo_ex_app/view/insert_list.dart';
import 'package:listview_todo_ex_app/view/table_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => TableList(),
        '/detail' : (context) => DetailList(),
        '/insert' : (context) => InsertList(),
      },
    );
  }
}