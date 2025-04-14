import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_17_app/model/staticdata.dart';
import 'package:quiz_17_app/view/add_view.dart';
import 'package:quiz_17_app/view/detail_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main View'),
        actions: [
          IconButton(
            onPressed: () async{
            await Get.to(AddView());
            setState(() {});
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: Staticdata.staticlist.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.to(DetailView(), arguments: index),
              child: Card(
                child: Row(
                  children: [
                    Icon(Staticdata.staticlist[index].showIcon),
                    Text(Staticdata.staticlist[index].text)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}