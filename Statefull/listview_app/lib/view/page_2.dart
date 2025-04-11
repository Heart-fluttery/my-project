import 'package:flutter/material.dart';
import 'package:listview_app/model/model.dart';

class Page2 extends StatefulWidget {
  final List<AnimalList> list;
  final List<Color> borderColor;
  const Page2({super.key, required this.list, required this.borderColor});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  // Property
  late TextEditingController nameController; // 동물 이름
  late int radioValue; // Radio Button
  late bool fly; // Check Box
  late String imagePath; // Image 선택
  late String imageName; // Image 이름

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    radioValue = 0;
    fly = false;
    imagePath = "";
    imageName = "";
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Add List'),
      //   backgroundColor: Colors.amberAccent,
      //   foregroundColor: Colors.white,
      //   centerTitle: true,
      // ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0,
                  groupValue: radioValue,
                  onChanged: (value) => radioChange(value),
                ),
                Text('양서류'),
                
                Radio(
                  value: 1,
                  groupValue: radioValue,
                  onChanged: (value) => radioChange(value),
                ),
                Text('파충류'),
                
                Radio(
                  value: 2,
                  groupValue: radioValue,
                  onChanged: (value) => radioChange(value),
                ),
                Text('포유류'),
                
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('날 수 있나요?'),
                Checkbox(
                  value: fly, 
                  onChanged: (value) {
                    fly = value!;
                    setState(() {});
                  },
                  ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => rebuildBorder(index),
                    child: Container(
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: widget.borderColor[index],
                          width: 2,
                        )
                      ),
                      child: Image.asset(
                        widget.list[index].imagePath
                      ),
                    ),
                  );
                },
              ),
            ),
            // SizedBox(
            //   height: 100,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           imagePath = 'images/cow.png';
            //           imageName = '젖소';
            //           setState(() {});
            //         },
            //         child: Image.asset(
            //           'images/cow.png',
            //           width: 80,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           imagePath = 'images/pig.png';
            //           imageName = '돼지';
            //           setState(() {});
            //         },
            //         child: Image.asset(
            //           'images/pig.png',
            //           width: 80,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           imagePath = 'images/bee.png';
            //           imageName = '벌';
            //           setState(() {});
            //         },
            //         child: Image.asset(
            //           'images/bee.png',
            //           width: 80,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           imagePath = 'images/fox.png';
            //           imageName = '여우';
            //           setState(() {});
            //         },
            //         child: Image.asset(
            //           'images/fox.png',
            //           width: 80,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           imagePath = 'images/monkey.png';
            //           imageName = '원숭이';
            //           setState(() {});
            //         },
            //         child: Image.asset(
            //           'images/monkey.png',
            //           width: 80,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           imagePath = 'images/cat.png';
            //           imageName = '고양이';
            //           setState(() {});
            //         },
            //         child: Image.asset(
            //           'images/cat.png',
            //           width: 80,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           imagePath = 'images/dog.png';
            //           imageName = '개';
            //           setState(() {});
            //         },
            //         child: Image.asset(
            //           'images/dog.png',
            //           width: 80,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           imagePath = 'images/wolf.png';
            //           imageName = '늑대';
            //           setState(() {});
            //         },
            //         child: Image.asset(
            //           'images/wolf.png',
            //           width: 80,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Text(imageName),
            ElevatedButton(
              onPressed: () =>  _showDialog(),
              child: Text('동물 추가하기'),
            ),
          ],
        ),
      ),
    );
  } // build

  // ---- Functions ----
  radioChange(int? value){
    radioValue = value!; // value 타입이 int? 라서 !로 풀어줘야함
    setState(() {});
  }

  _showDialog(){
    var animal = AnimalList(
      imagePath: imagePath, 
      animalName: nameController.text, 
      order: getOrder(radioValue), // radioValue는 int라서 함수로 따로 만들어줘야함
      fly: fly);

    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text(
            '동물 추가하기',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '이 동물은 ${animal.animalName} 입니다.\n'
            '또 동물의 종류는 ${animal.order} 입니다.\n'
            '이 동물은 날 수 ${animal.fly? '있' : '없'}습니다.\n'
            '이 동물을 추가 하시겠습니까?'
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.list.add(animal);
                Navigator.of(context).pop();
              }, 
              child: Text('예'),
            ),
            TextButton(
              onPressed: () {
                widget.list.add(animal);
                Navigator.of(context).pop();
              }, 
              child: Text('아니오'),
            ),
          ],
        );
      },
    );
  }

  String getOrder(int radioValue){
    String returnValue = "";
    switch(radioValue){
      case 0:
      returnValue = "양서류";
      case 1:
      returnValue = "파충류";
      case 2:
      returnValue = "포유류";
    }
    return returnValue;
  } // build

  rebuildBorder(int index){
    for (int i=0; i<widget.list.length; i++){
      widget.borderColor[i] = Colors.black;
    }
    widget.borderColor[index] = Colors.redAccent;
    setState(() {});
  }
} // Class