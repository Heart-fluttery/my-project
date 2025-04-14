import 'package:chart_ex_app/model/developer_data.dart';
import 'package:chart_ex_app/view/page1.dart';
import 'package:chart_ex_app/view/page2.dart';
import 'package:chart_ex_app/view/page3.dart';
import 'package:chart_ex_app/view/page4.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  // Property
  late TabController controller;
  late List<DeveloperData> data;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    data = [];
    addData();
  }

  addData(){
    data.add(DeveloperData(year: 2017, developers: 19000));
    data.add(DeveloperData(year: 2018, developers: 40000));
    data.add(DeveloperData(year: 2019, developers: 35000));
    data.add(DeveloperData(year: 2020, developers: 37000));
    data.add(DeveloperData(year: 2021, developers: 45000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          Page1(list: data),
          Page2(list: data),
          Page3(list: data),
          Page4(list: data),
        ]
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: [
          Tab(
            icon: Icon(
              Icons.looks_one,
            ),
            text: 'One',
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
            ),
            text: 'Two',
          ),
          Tab(
            icon: Icon(
              Icons.looks_3,
            ),
            text: 'Three',
          ),
          Tab(
            icon: Icon(
              Icons.looks_4,
            ),
            text: 'Four',
          ),
        ],
      ),
    );
  }
}