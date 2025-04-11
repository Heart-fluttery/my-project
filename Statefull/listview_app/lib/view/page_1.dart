import 'package:flutter/material.dart';
import 'package:listview_app/model/model.dart';
/*
  작성일 2025.04.02 작성자 이학현
  첫 화면, Listview로 Card(동물사진, 동물이름) 제작,  
*/
class Page1 extends StatefulWidget {
  // Property
  final List<AnimalList> list;
  // Constructor
  const Page1({super.key, required this.list});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  // Property
  // late List<AnimalList> animallist; // 동물 정보(파일이름, 동물이름, 동물군, 비행여부)

  // @override
  // void initState() {
  //   super.initState();
    // animallist = [];
    // addData();
  // }

  // addData(){
  //   animallist.add(AnimalList(imagePath: 'images/bee.png', animalName: 'bee', order: '파충류', fly: true));
  //   animallist.add(AnimalList(imagePath: 'images/cat.png', animalName: 'cat', order: '포유류', fly: false));
  //   animallist.add(AnimalList(imagePath: 'images/cow.png', animalName: 'cow', order: '포유류', fly: false));
  //   animallist.add(AnimalList(imagePath: 'images/dog.png', animalName: 'dog', order: '포유류', fly: false));
  //   animallist.add(AnimalList(imagePath: 'images/fox.png', animalName: 'fox', order: '포유류', fly: false));
  //   animallist.add(AnimalList(imagePath: 'images/monkey.png', animalName: 'monkey', order: '영장류', fly: false));
  //   animallist.add(AnimalList(imagePath: 'images/pig.png', animalName: 'pig', order: '포유류', fly: false));
  //   animallist.add(AnimalList(imagePath: 'images/wolf.png', animalName: 'wolf', order: '포유류', fly: false));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Listview Test'),
      //   foregroundColor: Colors.white,
      //   backgroundColor: Colors.blueAccent,
      //   centerTitle: true,
      // ),
      body: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _showDialog(index),
            child: SizedBox(
              height: 100,
              child: Card(
                color: Colors.white,
                child: Row(
                  children: [
                    Image.asset(
                      widget.list[index].imagePath,
                      fit: BoxFit.fill,
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      "    ${widget.list[index].animalName}",
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  } // build

  // ---- Functions ----
  _showDialog(int index){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(widget.list[index].animalName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          content: Row(
            children: [
              Image.asset(
                widget.list[index].imagePath,
                width: 50,
              ),
              Text(
                '    이 동물은 ${widget.list[index].order}입니다.\n'
                '    이 동물은 날 수 ${widget.list[index].fly? '있':'없'}습니다.'
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('종료'),
            ),
          ],
        );
      },
    );
  }
} // Class