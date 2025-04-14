import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_17_app/model/staticdata.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  int value = Get.arguments ?? "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Staticdata.staticlist[value].showIcon),
            Text(Staticdata.staticlist[value].text)
          ],
        ),
      ),
    );
  }
}