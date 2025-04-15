import 'package:collection_view_label_app/view/detail_hero.dart';
import 'package:collection_view_label_app/view/insert_hero.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QueryHero extends StatefulWidget {
  const QueryHero({super.key});

  @override
  State<QueryHero> createState() => _QueryHeroState();
}

class _QueryHeroState extends State<QueryHero> {

  // Property
  late List<String> heroList;

  @override
  void initState() {
    super.initState();
    heroList = ['유비', '관우', '장비', '조조', '여포', '초선', '손견', '장양', '손책'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('삼국지 인물'),
        actions: [
          IconButton(
            onPressed: () => Get.to(InsertHero())!.then((value) => rebuildData(value),), 
            icon: Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: heroList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 한 줄에 들어가는 셀 개수
          crossAxisSpacing: 10, // 셀간의 간격
          mainAxisSpacing: 10, // 줄간의 간격
        ), 
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.to(DetailHero(), arguments: heroList[index]),
            child: Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Center(
                child: Text(
                  heroList[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  } // build

  // ---- Functions ----
  rebuildData(value){
    if(value != '' && value != null){
      heroList.add(value);
      setState(() {});
    }
  }
} // class