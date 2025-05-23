import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

class DetailList extends StatefulWidget {
  const DetailList({super.key});

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail View'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              Message.imagePath
            ),
            Text(
              Message.workList
            ),
          ],
        ),
      ),
    );
  }
}